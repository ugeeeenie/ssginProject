package com.sinc.project.user.ctrl;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sinc.project.user.model.vo.UserVO;
import com.sinc.project.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserCtrl {
	
	@Resource(name="userService")
	private UserService service;
	
	@RequestMapping("/loginForm.sinc")
	public String loginForm() {
		System.out.println("UserCtrl loginForm");
		
		return "user/login";
	}

	@RequestMapping("/login.sinc")
	public void login(UserVO user, Model model, HttpSession session) {
		System.out.println("UserCtrl login");
		
		/** login process **/
		UserVO result = service.loginService(user);
		if(result == null) {
			System.out.println("invalid user login input");
			return;
		}
		model.addAttribute("loginUserModel", result);	// class annotation 으로 "loginUser" 걸어놓으면,
		/*******************/							// model.addAttribute()가 session.addAttribute() 됨
		
		
		/** remember me process **/
		if(user.isUseCookie()) {
			System.out.println("remember me is checked");
			int amount = 60 * 60 * 24 * 7;
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));	// expire date
			service.keepLogin(user.getId(), session.getId(), sessionLimit);
		}
		/*************************/
		
	}
	
	@RequestMapping("/logout.sinc")
	public String logout() {
		System.out.println("UserCtrl logout");
		
		return "redirect:../main.sinc";
	}
	
	@RequestMapping("/joinForm.sinc")
	public String joinForm() {
		System.out.println("UserCtrl joinForm");
		
		return "user/join";
	}
	
	@RequestMapping("/join.sinc")
	public String join(UserVO user, HttpServletRequest request) throws Exception {
		System.out.println("UserCtrl join");
		System.out.println("id: " + user.getId());
		System.out.println("pwd: " + user.getPwd());
		System.out.println("file: " + user.getFile());
		
		MultipartFile file = user.getFile();
		String originalFileName = file.getOriginalFilename();
		if(originalFileName != null || originalFileName.equals("")) {
			
			String path = request.getSession().getServletContext().getRealPath("/resources/img");
			
			String savedName = uidFile(path, originalFileName, file.getBytes());
			user.setImgSrc(savedName);
			
			System.out.println("path: " + path);
		} else {
			user.setImgSrc("images.png");
		}
		service.signupService(user);
		
		return "redirect:/main.sinc";
	}
	
	
	public String uidFile(String path, String name, byte[] dataAry) {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "+" + name;
		
		File target = new File(path, savedName);
		try {
			FileCopyUtils.copy(dataAry, target);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return savedName;
	}
	
	@RequestMapping("/androidLogin.sinc")
	@ResponseBody
	public UserVO androidLogin(UserVO user, Model model, HttpSession session) {
		System.out.println("UserCtrl androidLogin");
		
		UserVO result = service.loginService(user);
		return result;
	}
	
	
}
