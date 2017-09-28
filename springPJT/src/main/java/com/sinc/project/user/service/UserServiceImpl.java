package com.sinc.project.user.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sinc.project.user.model.sql.UserDao;
import com.sinc.project.user.model.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	// 	@Autowired annotation은 모호성 생김. 그냥 Resource쓰는게 맘편함.
	// 							그래도 Autowired 쓰고 싶으면, 아래와 같이
	// 	@Autowired
	// 	@Qualifier(value="{className}")	이렇게 annotation 2개 사용하면 됨.
		
	
	@Resource(name="userDao")
	private UserDao dao;
	
	@Override
	public UserVO loginService(UserVO user) {
		UserVO a = dao.loginRow(user);
		System.out.println(a);
		return dao.loginRow(user);
	}

	@Override
	public void keepLogin(String id, String sessionId, Date next) {
		
		// 아래와 같은 행위들은 서비스 로직에서 수행
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("sessionId", sessionId);
		map.put("next", next);
		
		dao.keepLoginRow(map);
	}

	@Override
	public UserVO checkUserWithSessionKey(String value) {
		return dao.checkUserWithSessionKeyRow(value);
	}

	@Override
	public void deleteUserSessionKey(String sessionId) {
		System.out.println("Service deleteUserSessionKey");
		
		dao.deleteUserSessionKeyRow(sessionId);
	}

	@Override
	public void signupService(UserVO user) {
		dao.signupRow(user);
	}

}
