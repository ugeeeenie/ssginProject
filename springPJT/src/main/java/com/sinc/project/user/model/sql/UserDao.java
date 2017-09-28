package com.sinc.project.user.model.sql;

import java.util.Map;

import com.sinc.project.user.model.vo.UserVO;

public interface UserDao {
	public UserVO loginRow(UserVO user);
	public void keepLoginRow(Map<String, Object> map);
	public UserVO checkUserWithSessionKeyRow(String value);
	public void deleteUserSessionKeyRow(String sessionId);
	public void signupRow(UserVO user);
}
