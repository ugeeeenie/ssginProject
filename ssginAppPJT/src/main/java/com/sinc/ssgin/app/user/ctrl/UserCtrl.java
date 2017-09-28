package com.sinc.ssgin.app.user.ctrl;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sinc.ssgin.app.model.vo.UserVO;
import com.sinc.ssgin.app.user.service.UserService;

@Controller
@RequestMapping("/ssgin")
public class UserCtrl {
	
	@Resource(name="userService")
	private UserService service;
	
	//로그인폼페이지
	@RequestMapping("/loginForm.app")
	public String loginForm(UserVO user){
		System.out.println("loginform ctrl ok");
		//UserVO result=service.LoginServiceRow(user);
		//System.out.println(result.getId());
		return "ssgin/loginForm";
	}
	
	//회원가입폼페이지
	@RequestMapping("/joinForm.app")
	public String joinForm(UserVO user){
		System.out.println("joinfrom ok");
		return "ssgin/joinForm";	
	}
	
	//비밀번호설정페이지
	@RequestMapping("/setPwd.app")
	public String setPwdForm(UserVO user){
		System.out.println("setpwdform ok");
		return "ssgin/setPwd";	
	}
	
	//약관동의페이지
	@RequestMapping("/userAgree.app")
	public String userAgreeForm(UserVO user){
		System.out.println("useragreeform ok");
		return "ssgin/userAgreeForm";	
	}

	//메인페이지
	@RequestMapping("/main.app")
	public String mainForm(UserVO user){
		System.out.println("mainform ok");
		return "ssgin/mainForm";	
	}
	
	//마이페이지
	@RequestMapping("/mypaging.app")
	public String myPage(UserVO user){
		System.out.println("mypage ok");
		return "ssgin/myPaging";	
	}
	
	//마이페이지>비밀번호변경페이지
	@RequestMapping("/updatePwd.app")
	public String updatePwd(){
		System.out.println("updatepwd ok");
		return "ssgin/updatePwd";
	}
	
	
	//마이페이지>계정해지페이지
	@RequestMapping("/userDelete.app")
	public String userDelete(){
		System.out.println("userdelete ok");
		return "ssgin/userDelForm";
	}
	
	//인증내역보기
	@RequestMapping("/authHistory.app")
	public String authHistory(){
		System.out.println("authHistory ok");
		return "ssgin/authHistory";
	}
	
	
}
