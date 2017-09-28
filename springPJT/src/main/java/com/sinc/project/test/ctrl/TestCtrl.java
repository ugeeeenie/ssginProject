package com.sinc.project.test.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class TestCtrl {
	
	@RequestMapping("/ssgin.sinc")
	public String ssgin() {
		System.out.println("TestCtrl ssgin");
		
		return "test/ssgin";
	}
	
	@RequestMapping("/account.sinc")
	public String account() {
		System.out.println("TestCtrl account");
		
		return "account/account";
	}
	
}
