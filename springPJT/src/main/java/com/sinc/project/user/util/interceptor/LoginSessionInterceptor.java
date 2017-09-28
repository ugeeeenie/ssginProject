package com.sinc.project.user.util.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.sinc.project.user.model.vo.UserVO;
import com.sinc.project.user.service.UserService;

public class LoginSessionInterceptor extends HandlerInterceptorAdapter {
	@Resource(name = "userService")
	private UserService service;

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		System.out.println("LoginSessionInterceptor preHandle");
		HttpSession session = request.getSession();

		if (session == null || session.getAttribute("loginUser") == null) {
			session = request.getSession(true);

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			System.out.println(loginCookie);

			if (loginCookie != null) {
				System.out.println(loginCookie.getValue());
				
				UserVO user = service.checkUserWithSessionKey(loginCookie.getValue());
				if(user != null) {
					session.setAttribute("loginUser", user);
					return true;
				}
			}
			
			String currentPath = request.getRequestURI();
			String queryString = request.getQueryString();
			if (queryString != null) {
				currentPath += "?" + queryString;
			}

			session.setAttribute("lastURI", currentPath);
			response.sendRedirect("/user/loginForm.sinc");
			return false;
		}
		return true;

	}

}
