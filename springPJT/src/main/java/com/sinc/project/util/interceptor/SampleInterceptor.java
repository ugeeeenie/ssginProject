package com.sinc.project.util.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SampleInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,	
			HttpServletResponse response, Object handler) throws Exception {	// servlet이 controller를 호출하기 전에 콜백되는 메서드
		System.out.println("preHandle");

		HandlerMethod method = (HandlerMethod) handler;
		Method methodObj = method.getMethod();
		
		System.out.println("Bean: " + method.getBean().getClass());
		System.out.println("Method: " + methodObj);
		
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {	// controller가 servlet으로 리턴하기 전에 콜백되는 메서드
		System.out.println("postHandle");
	}

}
