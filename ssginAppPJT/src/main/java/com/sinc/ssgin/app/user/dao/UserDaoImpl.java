package com.sinc.ssgin.app.user.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.sinc.ssgin.app.model.vo.UserVO;

@Repository("Userdao")
public class UserDaoImpl implements UserDao{
	
	public static final String PREFIX="com.sinc.ssgin.app.mapper.";
	
	@Resource(name="sqlSession")
	private SqlSession session;
	@Override
	public UserVO LoginDaoRow(UserVO user) {
		// TODO Auto-generated method stub
		System.out.println("logindaorow ok");
		UserVO re=new UserVO("kimhanjo","123","adf","adfdfs","adfasdf");	
		//return session.selectOne(PREFIX+"login", user);			데이터베이스 만들면 풀기
		return re;
	}

}
