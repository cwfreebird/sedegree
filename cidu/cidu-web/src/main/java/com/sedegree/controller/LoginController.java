package com.sedegree.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 登录控制器
 * 
 * @author caiwei
 * 
 */
@Controller
public class LoginController {
	private static Logger logger = LoggerFactory
			.getLogger(LoginController.class);

	/**
	 * 登录页
	 * 
	 * @param model
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/login")
	public String login(Model model, 
			HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {
		logger.info("登录");
		if (error != null) {
			//model.addAttribute("error", "用户名或密码不正确!");
		}
 
		if (logout != null) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (auth != null){    
				new SecurityContextLogoutHandler().logout(request, response, auth);
			}
			//model.addAttribute("msg", "您已成功注销系统.");
		}
		return "login";
	}
	/*@RequestMapping(method = RequestMethod.GET, value = "/doLogin")
	public void doLogin(Model model, HttpServletRequest request) {
		logger.info("登录成功");
	}*/

	@RequestMapping(method = RequestMethod.GET, value = "/denied")
	public String denied(){
		logger.info("权限不够 , 无法访问!");
		return "denied";
	}
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request,Model model){
		return "index";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
       Authentication auth = SecurityContextHolder.getContext().getAuthentication();
       if (auth != null){
          new SecurityContextLogoutHandler().logout(request, response, auth);
       }
       return "login";
    }
}
