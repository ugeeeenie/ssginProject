package com.sinc.bootstrap;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sinc.bootstrap.model.vo.BootVO;
import com.sinc.bootstrap.service.BootService;

@Controller	//<bean ~과 동일
public class BootCtrl {
	//dependency inject
	@Resource(name="bootService")
	private BootService service;
	
	@RequestMapping("/carousel.sinc")
	public String carousel(){
		System.out.println("BootCtrl carousel ok");
		return "carousel/index";
	}
	
	@RequestMapping(value="/collapse.sinc", method=RequestMethod.GET)	//앵커로 
	public String collapse(Model model){
		System.out.println("Collapse ok");
		
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("msg1", "aaa");
		map.put("msg2", "bbb");
		map.put("msg3", "ccc");
		
		model.addAttribute("map", map);
		
		return "collapse/collapse";
	}
	
	////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="collapseAjax.sinc", method=RequestMethod.POST)		//폼으로
	public @ResponseBody Map<String, String> collapseAjax(Model model){
		System.out.println("Ajax ok");
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("msg1", "111");
		map.put("msg2", "222");
		map.put("msg3", "333");
		
		return map;
	}	
	////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="tab/tab.sinc")
	public String toggleTab(Model model){
		System.out.println("tab ok");
		
		List<BootVO> list=service.tabService();
		model.addAttribute("list", list);
		
		return "tab/toggletab";
	}	
	////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="modal.sinc")
	public String Modal(Model model){
		System.out.println("modal ok");
		
		
		
		return "modal/modal";
	}	
	
	@RequestMapping(value="login.sinc", method=RequestMethod.POST)
	public String login(BootVO boot){
		System.out.println("login OK");
		System.out.println("param"+" "+boot.getId()+"\t"+boot.getPwd());
		String path="error";
		if(boot.getId().equals("jslim") && boot.getPwd().equals("jslim")){
			System.out.println("login!!!!");
			path="redirect:/main.sinc";
		}
		
		return path;
	}
	
	@RequestMapping(value="modalAjax.sinc", method=RequestMethod.POST)
	public @ResponseBody BootVO loginAjax(BootVO boot){
		
		System.out.println("modalAjax OK");
		
		return service.ajaxService(boot);
	}	
	
	@RequestMapping(value="thumbnail.sinc")
	public String thumbnail(Model model){
		
		System.out.println("thumbnail OK");
		model.addAttribute("imgMap", service.imgService());
		
		return "thumbnail/thumbnail";
	}	
		
}