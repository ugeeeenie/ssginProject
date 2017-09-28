package com.sinc.ssgin.app.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sinc.ssgin.app.model.vo.UserVO;
import com.sinc.ssgin.app.user.dao.UserDao;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource(name="userDao")
	private UserDao dao;
	
	@Override
	public UserVO LoginServiceRow(UserVO user) {
		// TODO Auto-generated method stub
		System.out.println("loginservicerow ok");
		return dao.LoginDaoRow(user);
	}
	
}
