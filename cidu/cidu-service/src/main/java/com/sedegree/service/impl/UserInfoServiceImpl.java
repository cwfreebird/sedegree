package com.sedegree.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sedegree.dao.UserInfoMapper;
import com.sedegree.domain.UserInfo;
import com.sedegree.service.IUserInfoService;

@Service("userInfoService")
public class UserInfoServiceImpl implements IUserInfoService {

	@Resource
	private UserInfoMapper userInfoMapper;

	@Override
	public int deleteByPrimaryKey(Long id) {
		return userInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(UserInfo record) {
		record.setId(null);
		return userInfoMapper.insert(record);
	}

	@Override
	public int insertSelective(UserInfo record) {
		return userInfoMapper.insertSelective(record);
	}

	@Override
	public UserInfo selectByPrimaryKey(Long id) {
		return userInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(UserInfo record) {
		return userInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(UserInfo record) {
		return userInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public UserInfo selectByLoginId(String loginId) {
		return userInfoMapper.selectByLoginId(loginId);
	}

	@Override
	public UserInfo selectUserProfileByLoginId(String loginId) {
		return userInfoMapper.selectUserProfileByLoginId(loginId);
	}
	
}
