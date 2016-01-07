package com.sedegree.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Hashtable;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.sedegree.domain.CustomerInfo;
import com.sedegree.service.ICustomerInfoService;
import com.sedegree.thread.CreateMatrixThread;
import com.sedegree.utils.MatrixToImageWriter;
import com.sedegree.utils.SedegreeUtils;

@Controller
@RequestMapping("/customer")
public class CustomerInfoController {

	private static Logger log = Logger.getLogger(CustomerInfoController.class);
	
	@Resource
	private ICustomerInfoService customerInfoService;
	
	@Autowired
	private ThreadPoolTaskExecutor matrixTaskExecutor;
	
	@Value("${matrixImagePath}")
	private String matrixImagePath;
	
	@Value("${matrixImageText}")
	private String matrixImageText;
	
	@Value("${matrixImageUrl}")
	private String matrixImageUrl;
	
	@ModelAttribute
	public void userName(Model model){
		model.addAttribute("userName", SedegreeUtils.getPrincipal());
	}
	
	@RequestMapping("/add")
	public String add(Model model, @RequestParam(value = "records", defaultValue = "1") String records){
		for(int i = 0; i < Integer.parseInt(records); i ++){
			CustomerInfo customer = new CustomerInfo();
			customer.setId(SedegreeUtils.getUUID());
			customer.setStatus("Y");
			customer.setCreateTime(SedegreeUtils.getCurrentTimestamp());
			
			int num = customerInfoService.addCustomer(customer);
			if(num > 0){
				this.createMatrixImage(customer.getId());
			}
		}
		return "redirect:list.do";
	}
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request ,Model model){
		//System.out.println(System.getProperty("user.dir"));
		//System.out.println(Thread.currentThread().getContextClassLoader().getResource("/").toString());
		List<CustomerInfo> customers = customerInfoService.getCustomers();
		model.addAttribute("customers", customers);
		model.addAttribute("matrixImageUrl", matrixImageUrl);
		
		return "customer/list";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(CustomerInfo customer , Model model){
		customerInfoService.updateByPrimaryKeySelective(customer);
		
		//后台更新
		if(StringUtils.isNotBlank(customer.getStatus())){
			return "redirect:list.do";
		} else {
			//客户更新
			return "redirect:view/" + customer.getId() + ".do";
		}
	}
	
	@RequestMapping("/detail/{id}")
	public String detail(@PathVariable String id,Model model){
		CustomerInfo customer = customerInfoService.getCustomerById(id);
		model.addAttribute("customer", customer);
		return "customer/detail";
	}
	
	@RequestMapping("/view/{id}")
	public String view(@PathVariable String id,Model model){
		CustomerInfo customer = customerInfoService.getCustomerById(id);
		model.addAttribute("customer", customer);
		return "customer/view";
	}
	
	@RequestMapping("/download")
	public void download(HttpServletRequest request, 
			HttpServletResponse response, 
			@RequestParam(value = "fileIds") String ids){
		String[] fileIds = ids.split(",");
		if(fileIds.length == 0){
			return;
		}
		File[] files = new File[fileIds.length];
		for(int i = 0; i < fileIds.length; i ++){
			if(StringUtils.isNotBlank(fileIds[i])){
				files[i] = new File(matrixImagePath + fileIds[i] + ".gif");
				
				if(!files[i].exists()){
					this.createMatrixImage(fileIds[i]);
				}
			}
		}
		
		String tmpFileName = String.valueOf(System.currentTimeMillis()) + ".zip";
		String targetFile = request.getSession().getServletContext().getRealPath("/");
		String strZipPath = targetFile + File.separator + tmpFileName;
		String zipFile = this.zipImages(files, strZipPath);
		if(!"".equals(zipFile)){
			this.downloadImages(response, zipFile, tmpFileName);
		}
	}
	
	@RequestMapping("/updateFlag")
	public String updateFlag(@RequestParam(value = "updateFlagForm_fileIds", required = true) String ids,
			@RequestParam(value = "updateFlagForm_flag", required = true) String flag){
		String[] fileIds = ids.split(",");
		if(fileIds.length == 0){
			return "redirect:list.do";
		}
		
		List<CustomerInfo> customers = new ArrayList<>();
		for(int i = 0; i < fileIds.length; i ++){
			CustomerInfo customer = new CustomerInfo();
			customer.setFlag(flag);
			customer.setId(fileIds[i]);
			
			customers.add(customer);
		}
		
		customerInfoService.updateByPrimaryKeySelective(customers);
		
		return "redirect:list.do";
	}
	
	private boolean hasRole(String roleName){
		Collection<? extends GrantedAuthority> list = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		for(GrantedAuthority g : list){
			System.out.println("=====" + ("ROLE_" + roleName).equals(g.getAuthority()));
		}
		
		return list.contains(roleName);
	}
	
	//二维码打包
	private String zipImages(File[] files, String strZipPath){
		ZipOutputStream out = null;
		FileInputStream fis = null;
		try {
			byte[] buffer = new byte[1024];
			out = new ZipOutputStream(new FileOutputStream(strZipPath));
			for(int i = 0; i < files.length; i ++){
				fis = new FileInputStream(files[i]);  
                out.putNextEntry(new ZipEntry(files[i].getName()));  
                
                int len;  
                // 读入需要下载的文件的内容，打包到zip文件  
                while ((len = fis.read(buffer)) > 0) {  
                    out.write(buffer, 0, len);  
                }  
                
			}
		} catch (FileNotFoundException e) {
			log.error("压缩二维码图片出错FileNotFoundException:" + e.getMessage());
			strZipPath = "";
		} catch (IOException e) {
			log.error("压缩二维码图片出错IOException:" + e.getMessage());
			strZipPath = "";
		} finally {
			try {
				fis.close();
				out.closeEntry();  
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return strZipPath;
	}

	private void downloadImages(HttpServletResponse response, String path, String fileName) {
		InputStream ins = null;
		BufferedInputStream bins = null;
		OutputStream outs = null;
		BufferedOutputStream bouts = null;
		
		File file = new File(path);
		try {  
            
            if (file.exists()) {
                ins = new FileInputStream(path);  
                bins = new BufferedInputStream(ins);// 放到缓冲流里面 
                outs = response.getOutputStream();// 获取文件输出IO流  
                bouts = new BufferedOutputStream(outs);
                
                response.setContentType("application/x-download");// 设置response内容的类型 
                response.setHeader(  
                        "Content-disposition",  
                        "attachment;filename="  
                                + URLEncoder.encode(fileName, "UTF-8"));// 设置头部信息  
                int bytesRead = 0;  
                byte[] buffer = new byte[8192];  
                // 开始向网络传输文件流  
                while ((bytesRead = bins.read(buffer, 0, 8192)) != -1) {  
                    bouts.write(buffer, 0, bytesRead);  
                }  
                bouts.flush();// 这里一定要调用flush()方法  
                
            } else {
            	log.error("二维码压缩文件不存在");
               // response.sendRedirect("../error.jsp");  
            }  
        } catch (IOException e) {  
           log.error("文件下载出错:", e);  
        } finally {
        	try {
				ins.close();
				bins.close();  
				outs.close();  
				bouts.close();  
			} catch (IOException e) {
				e.printStackTrace();
			}
        	
        	file.delete();//下载后删文件
        }
	}
	
	private void createMatrixImage(String id){
		String text = matrixImageText + id + ".do";
		String imageFullPath = matrixImagePath + id;
		//MatrixToImageWriter.createBitMatrixImage(text, imageFullPath);
		matrixTaskExecutor.execute(new CreateMatrixThread(text, imageFullPath));
	}
}
