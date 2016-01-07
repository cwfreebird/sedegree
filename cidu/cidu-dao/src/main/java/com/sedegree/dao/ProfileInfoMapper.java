package com.sedegree.dao;

import com.sedegree.domain.ProfileInfo;

public interface ProfileInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ProfileInfo record);

    int insertSelective(ProfileInfo record);

    ProfileInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ProfileInfo record);

    int updateByPrimaryKey(ProfileInfo record);
}