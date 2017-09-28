package com.sinc.project.user.service;

import java.util.Date;

import com.sinc.project.user.model.vo.UserVO;

public interface UserService {
	public UserVO loginService(UserVO user);
	public void keepLogin(String id, String sessionId, Date next);	// userID, sessionID, expireDate
	public UserVO checkUserWithSessionKey(String value);	// exp check method
	public void deleteUserSessionKey(String sessionId);
	public void signupService(UserVO user);
}
