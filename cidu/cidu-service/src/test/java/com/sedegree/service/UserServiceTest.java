package com.sedegree.service;

import javax.annotation.Resource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sedegree.domain.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-mybatis.xml"})
public class UserServiceTest {

	private ApplicationContext ac = null;  
	
	@Resource
	private IUserService userService;
	
	@Test
	public void testGetUserById(){
		int userId = 1;
		User user = userService.getUserById(userId);
		System.out.println(user);
	}
	
	/*@Before  
	public void before() {
		ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		userService = (IUserService) ac.getBean("userService");
	}*/
}
