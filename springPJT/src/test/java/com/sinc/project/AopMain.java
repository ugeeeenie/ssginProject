package com.sinc.project;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sinc.project.aop.target.MessageService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})	// JUnit이 root-context 포함해야 @Repository 읽어들일 수 있음

public class AopMain {

	@Resource(name="target")
	private MessageService service;
	
	@Test
	public void callTargetAop() {
		//service.addMessage();
		service.selectService();
	}
}