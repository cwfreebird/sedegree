package com.sedegree.service;

import com.sedegree.domain.UserInfo;

public interface IUserInfoService {
	int deleteByPrimaryKey(Long id);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Long id);
    
    UserInfo selectByLoginId(String loginId);
    
    UserInfo selectUserProfileByLoginId(String loginId);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);
}