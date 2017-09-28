package com.sinc.ssgin.app.main.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainCtrl {
	
	@RequestMapping("/intro.app")
	public String main() {
		System.out.println("MainCtrl main");
		return "index";
	}
}