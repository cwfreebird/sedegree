package com.sedegree.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sedegree.dao.CustomerInfoMapper;
import com.sedegree.domain.CustomerInfo;
import com.sedegree.service.ICustomerInfoService;

@Service("customerInfoService")
public class CustomerInfoServiceImpl implements ICustomerInfoService {

	@Resource
	private CustomerInfoMapper customerInfoMapper;

	public CustomerInfo getCustomerById(String id) {
		return customerInfoMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(CustomerInfo customerInfo) {
		return customerInfoMapper.updateByPrimaryKeySelective(customerInfo);
	}

	public int addCustomer(CustomerInfo customerInfo) {
		return customerInfoMapper.insertSelective(customerInfo);
	}

	public List<CustomerInfo> getCustomers() {
		return customerInfoMapper.getCustomers();
	}
	
}
