package com.sinc.project.user.util.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		System.out.println("LoginInterceptor postHandle");
		
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object obj = modelMap.get("loginUserModel");
		
		if(obj != null) {
			System.out.println("LoginInterceptor obj is not null");
			session.setAttribute("loginUser", obj);
			
			/** setting cookie to remember me **/
			if(request.getParameter("useCookie") != null) {
				System.out.println("LoginInterceptor remember me proc");
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setMaxAge(60 * 60 * 24 * 7);	// 1 week
				loginCookie.setPath("/");
				response.addCookie(loginCookie);
			}
			/**********************************/
			
			
			/** setting last URL **/
			String path = (String) session.getAttribute("lastURI");
			if(path == null) {
				path = "../main.sinc";
			}
			/**********************/
			
			response.sendRedirect(path);
		}
		
	}
}
