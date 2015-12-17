package com.sedegree.controller;

import java.io.File;
import java.io.IOException;
import java.util.Hashtable;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.sedegree.domain.CustomerInfo;
import com.sedegree.service.ICustomerInfoService;
import com.sedegree.utils.MatrixToImageWriter;
import com.sedegree.utils.SedegreeUtils;

@Controller
@RequestMapping("/customer")
public class CustomerInfoController {

	private static Logger log = Logger.getLogger(CustomerInfoController.class);
	
	@Resource
	private ICustomerInfoService customerInfoService;
	
	@Value("${matrixImagePath}")
	private String matrixImagePath;
	
	@Value("${matrixImageUrl}")
	private String matrixImageUrl;
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request , Model model){
		CustomerInfo customer = new CustomerInfo();
		customer.setId(SedegreeUtils.getUUID());
		customer.setStatus("Y");
		customer.setCreateTime(SedegreeUtils.getCurrentTimestamp());
		
		int i = customerInfoService.addCustomer(customer);
		if(i > 0){
			String text = matrixImageUrl + customer.getId() + ".do";
			String imageFullPath = matrixImagePath + customer.getId();
			MatrixToImageWriter.createBitMatrixImage(text, imageFullPath);
		}
		return "redirect:list.do";
	}
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request ,Model model){
		System.out.println(System.getProperty("user.dir"));
		System.out.println(Thread.currentThread().getContextClassLoader().getResource("/").toString());
		List<CustomerInfo> customers = customerInfoService.getCustomers();
		model.addAttribute("customers", customers);
		return "customer/list";
	}
	
	@RequestMapping("/update")
	public String update(CustomerInfo customer , Model model){
		customerInfoService.updateByPrimaryKeySelective(customer);
		return "redirect:list.do";
	}
	
	@RequestMapping("/detail/{id}")
	public String detail(@PathVariable String id,Model model){
		CustomerInfo customer = customerInfoService.getCustomerById(id);
		model.addAttribute("customer", customer);
		return "customer/detail";
	}
	
}
