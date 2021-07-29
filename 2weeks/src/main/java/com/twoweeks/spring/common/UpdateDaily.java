package com.twoweeks.spring.common;

import java.util.Date;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class UpdateDaily extends QuartzJobBean{

	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		//주기적으로 실행할 메소드 작성
		Date time=new Date();
		System.out.println("---- quartz 테스트 : "+time+"-----");
		
	}

	
}
