package com.sinc.project.user.util.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.sinc.project.user.service.UserService;

public class LogoutInterceptor extends HandlerInterceptorAdapter{
	
	@Resource(name="userService")
	private UserService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println("LogoutInterceptor");
		
		
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		String sessionId = loginCookie.getValue();
		
		if(sessionId != null) {
			service.deleteUserSessionKey(sessionId);
			loginCookie.setMaxAge(-1);	// 1 week
			
			response.addCookie(loginCookie);	
		}
		
		return true;
	}
	
}
