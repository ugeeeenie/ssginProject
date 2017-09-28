package com.sinc.ssgin.app.user.ctrl;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sinc.ssgin.app.model.vo.UserVO;
import com.sinc.ssgin.app.user.service.UserService;

@Controller
public class UserCtrl {
	
	@Resource(name="Userservice")
	private UserService service;
	
	//로그인폼페이지
	@RequestMapping("LoginForm.app")
	public String loginForm(UserVO user){
		//System.out.println("loginform ctrl ok");
		UserVO result=service.LoginServiceRow(user);
		//System.out.println(result.getId());
		return "LoginForm";
	}
	
	//회원가입폼페이지
	@RequestMapping("JoinForm.app")
	public String JoinForm(UserVO user){
		//System.out.println("joinfrom ok");
		return "JoinForm";	
	}
	
	//비밀번호설정페이지
	@RequestMapping("SetPwd.app")
	public String SetPwdForm(UserVO user){
		//System.out.println("setpwdform ok");
		return "SetPwd";	
	}
	
	//약관동의페이지
	@RequestMapping("UserAgree.app")
	public String UserAgreeForm(UserVO user){
		//System.out.println("useragreeform ok");
		return "UserAgreeForm";	
	}

	//메인페이지
	@RequestMapping("main.app")
	public String MainForm(UserVO user){
		System.out.println("mainform ok");
		return "MainForm";	
	}
	
	//마이페이지
	@RequestMapping("MyPage.app")
	public String MyPage(UserVO user){
		System.out.println("mypage ok");
		return "MyPage";	
	}
	
	//마이페이지>비밀번호변경페이지
	@RequestMapping("UpdatePwd.app")
	public String UpdatePwd(){
		System.out.println("updatepwd ok");
		return "UpdatePwdForm";
	}
	
	
	//마이페이지>계정해지페이지
	@RequestMapping("UserDelete.app")
	public String UserDelete(){
		System.out.println("updatepwd ok");
		return "UserDeleteForm";
	}
	
	//인증내역보기
	@RequestMapping("IdHistory.app")
	public String IdHistory(){
		System.out.println("idHistory ok");
		return "IdHistory";
	}
	
	
}
