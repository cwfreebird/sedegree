package com.sedegree.service;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sedegree.domain.CustomerInfo;
import com.sedegree.utils.SedegreeUtils;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-mybatis.xml"})
public class CustomerServiceTest {

	@Resource
	private ICustomerInfoService customerService;
	
	@Test
	public void testGetAddCustomer(){
		CustomerInfo customer = new CustomerInfo();
		customer.setId(SedegreeUtils.getUUID());
		customer.setStatus("Y");
		customer.setCreateTime(SedegreeUtils.getCurrentTimestamp());
		customer.setUpdateTime(customer.getCreateTime());
		int i = customerService.addCustomer(customer);
		System.out.println(i);
	}
	
	@Test
	public void testGetCustomers(){
		List<CustomerInfo> customers = customerService.getCustomers();
		Assert.assertNotNull("未找到记录", customers);
		customers.forEach(c -> System.out.println("id:" + c.getId()));
	}
	
	@Test
	public void testDetail(){
		String id = "407807d55f184b01a89c37e538185a4a";
		CustomerInfo customer = customerService.getCustomerById(id);
		Assert.assertNotNull("未找到记录", customer);
		System.out.println(customer.getId());
	}
	
	@Test
	public void testUpdate(){
		String id = "407807d55f184b01a89c37e538185a4a";
		CustomerInfo customer = customerService.getCustomerById(id);
		customer.setName("张三");
		customer.setMobile("15555555555");
		customer.setAddress("广州");
		customer.setUpdateTime(null);
		System.out.println(customerService.updateByPrimaryKeySelective(customer));
	}
}
