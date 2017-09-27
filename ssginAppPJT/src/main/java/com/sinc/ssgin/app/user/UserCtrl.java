package com.sinc.ssgin.app.user;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sinc.ssgin.app.model.vo.UserVO;
import com.sinc.ssgin.app.user.service.UserService;

@Controller
public class UserCtrl {
	
	@Resource(name="Userservice")
	private UserService service;
	
	@RequestMapping("LoginForm.app")
	public String loginForm(UserVO user){
		System.out.println("loginform ctrl ok");
		UserVO result=service.LoginServiceRow(user);
		System.out.println(result.getId());
		return "LoginForm";
	}
	
	@RequestMapping("JoinForm.app")
	public String JoinForm(UserVO user){
		System.out.println("joinfrom ok");
		return "JoinForm";	
	}
	
	@RequestMapping("SetPwd.app")
	public String SetPwdForm(UserVO user){
		System.out.println("setpwdform ok");
		return "SetPwd";	
	}
	
	@RequestMapping("UserAgree.app")
	public String UserAgreeForm(UserVO user){
		System.out.println("useragreeform ok");
		return "UserAgreeForm";	
	}
}
