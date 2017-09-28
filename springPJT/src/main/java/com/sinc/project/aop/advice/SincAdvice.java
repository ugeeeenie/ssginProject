package com.sinc.project.aop.advice;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component("log")
@Aspect
public class SincAdvice {
	
	@Before("execution(public * com.sinc.project.aop.target..*Impl.add*(..))")
	public void startLog() {
		System.out.println("타겟메서드 실행 전 호출되는 공통의 관심사항");
	}
	
	@After("execution(public * com.sinc.project.aop.target..*Impl.add*(..))")
	public void afterLog() {
		System.out.println("타겟메서드 실행 후 호출되는 공통의 관심사항");
	}
	
	@AfterReturning(pointcut="execution(public * com.sinc.project.aop.target..*Impl.select*(..))", returning="obj")
	public void afterReturningLog(Object obj) {
		System.out.println("afterReturningLog: " + obj);
	}
}
