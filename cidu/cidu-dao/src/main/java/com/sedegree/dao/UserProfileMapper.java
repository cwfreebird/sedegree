package com.sedegree.dao;

import com.sedegree.domain.UserProfileKey;

public interface UserProfileMapper {
    int deleteByPrimaryKey(UserProfileKey key);

    int insert(UserProfileKey record);

    int insertSelective(UserProfileKey record);
}