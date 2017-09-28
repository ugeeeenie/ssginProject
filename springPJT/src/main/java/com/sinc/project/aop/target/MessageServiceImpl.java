package com.sinc.project.aop.target;

import org.springframework.stereotype.Service;

@Service("target")
public class MessageServiceImpl implements MessageService{

	@Override
	public void addMessage() {
		System.out.println("dao.create()");
		System.out.println("dao.updatePoint()");	
	}

	@Override
	public String selectService() {
		System.out.println("dao.selectRow()");
		
		return "쉬는시간";
	}
}
