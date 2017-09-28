package com.sinc.project.util.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class InterceptorCtrl {
	
	@RequestMapping("/a.sinc")
	public String a() {
		System.out.println("Ctrl a");
		
		return "a";
	}
	
	@RequestMapping("/b.sinc")
	public void b() {
		System.out.println("Ctrl b");
		
	}
	
	@RequestMapping("/c.sinc")
	public ModelAndView c() {		// model, view 에 대한 정보를 담는 객체
		System.out.println("Ctrl c");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ctemp");
		mv.addObject("key", "value");
		
		return mv;		// view 랑 model을 하나의 객체에 담아서 리턴.
						// 스프링이 mv객체로 뷰랑 데이터 이용해서 화면 렌더링 
	}
	
	@RequestMapping("/d.sinc")
	public String d(RedirectAttributes attr) {
		System.out.println("Ctrl d");
		
		attr.addFlashAttribute("msg01", "jslim");
		
		return "redirect:/e.sinc";
	}
	
	@RequestMapping("/e.sinc")
	public String e(@ModelAttribute("msg01") String msg01, Model model) {
		System.out.println("Ctrl e");
		model.addAttribute("msg02", "조현재");
		
		return "e";
	}
}

