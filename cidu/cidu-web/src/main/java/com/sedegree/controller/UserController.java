package com.sedegree.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sedegree.domain.User;
import com.sedegree.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Resource
	private IUserService userService;
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request,Model model){
//		User user = userService.getUserById(1);
//		model.addAttribute("user", user);
		return "index";
	}
}
