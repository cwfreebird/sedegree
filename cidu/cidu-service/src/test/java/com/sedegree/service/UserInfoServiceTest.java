package com.sedegree.service;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sedegree.domain.UserInfo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-mybatis.xml"})
public class UserInfoServiceTest {

	private ApplicationContext ac = null;  
	
	@Resource
	private IUserInfoService userInfoService;
	
	@Test
	public void testInsertSelective(){
		UserInfo record = new UserInfo();
		record.setLoginId("cidu");
		record.setUsername("次度客户");
		record.setPassword(cryPassword());
		int i =userInfoService.insertSelective(record);
		System.out.println(i);
	}
	
	@Test
	public void testFindByLoginId(){
		UserInfo record =userInfoService.selectByLoginId("admin");
		System.out.println(record);
	}
	
	@Test
	public void testSelectUserProfileByLoginId(){
		UserInfo record =userInfoService.selectUserProfileByLoginId("admin");
		System.out.println(record.getProfiles().size());
	}
	
	private String cryPassword(){
		String password = "51cidu";
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encoder = passwordEncoder.encode(password);
        System.out.println(encoder);
        return encoder;
	}
	/*@Before  
	public void before() {
		ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		userService = (IUserService) ac.getBean("userService");
	}*/
}
