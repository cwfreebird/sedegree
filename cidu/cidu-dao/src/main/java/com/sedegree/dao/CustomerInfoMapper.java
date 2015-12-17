package com.sedegree.dao;

import java.util.List;

import com.sedegree.domain.CustomerInfo;

public interface CustomerInfoMapper {
    int deleteByPrimaryKey(String id);

    int insert(CustomerInfo record);

    int insertSelective(CustomerInfo record);

    CustomerInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(CustomerInfo record);

    int updateByPrimaryKey(CustomerInfo record);
    
    List<CustomerInfo> getCustomers();
}