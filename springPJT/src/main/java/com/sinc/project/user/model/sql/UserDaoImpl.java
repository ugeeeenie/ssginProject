package com.sinc.project.user.model.sql;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sinc.project.user.model.vo.UserVO;

@Repository("userDao")
public class UserDaoImpl implements UserDao {

	public static final String PREFIX = "com.sinc.project.mapper.user.";
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	@Override
	public UserVO loginRow(UserVO user) {
		System.out.println("Dao loginRow");
		
		return session.selectOne(PREFIX + "login", user);
	}

	@Override
	public void keepLoginRow(Map<String, Object> map) {
		System.out.println("Dao keepLoginRow");
		
		session.update(PREFIX + "keepLogin", map);
	}

	@Override
	public UserVO checkUserWithSessionKeyRow(String value) {
		System.out.println("Dao checkUserWithSessionKeyRow");
		
		return session.selectOne(PREFIX + "sessionKey", value);
	}

	@Override
	public void deleteUserSessionKeyRow(String sessionId) {
		System.out.println("Dao deleteUserSessionKeyRow");
		
		session.update(PREFIX + "deleteSession", sessionId);
	}

	@Override
	public void signupRow(UserVO user) {
		System.out.println("Dao signupRow");
		
		session.insert(PREFIX + "signup", user);
	}
	
}