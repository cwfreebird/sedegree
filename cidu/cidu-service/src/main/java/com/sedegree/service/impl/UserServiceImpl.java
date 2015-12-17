package com.sedegree.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sedegree.dao.UserMapper;
import com.sedegree.domain.User;
import com.sedegree.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {

	@Resource
	private UserMapper userMapper;
	
	public User getUserById(int userId) {
		return userMapper.selectByPrimaryKey(userId);
	}
}
