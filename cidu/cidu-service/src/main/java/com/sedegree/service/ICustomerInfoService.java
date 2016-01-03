package com.sedegree.service;

import java.util.List;

import com.sedegree.domain.CustomerInfo;

public interface ICustomerInfoService {
	CustomerInfo getCustomerById(String id);
	
	int updateByPrimaryKeySelective(CustomerInfo customerInfo);
	
	int updateByPrimaryKeySelective(List<CustomerInfo> customers);
	
	int addCustomer(CustomerInfo customerInfo);
	
	List<CustomerInfo> getCustomers();
}