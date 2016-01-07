package com.sedegree.dao;

import com.sedegree.domain.UserInfo;

public interface UserInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Long id);
    
    UserInfo selectByLoginId(String loginId);
    
    UserInfo selectUserProfileByLoginId(String loginId);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);
}