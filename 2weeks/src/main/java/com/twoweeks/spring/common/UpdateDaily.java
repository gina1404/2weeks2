package com.twoweeks.spring.common;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.twoweeks.spring.covid.model.service.CovidUpdateRegionalKorService;

@Controller
public class UpdateDaily extends QuartzJobBean{
	

	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		//주기적으로 실행할 메소드 작성
		Date time=new Date();
		System.out.println("---- quartz 테스트 : "+time+"-----");			
	}
	
	
}
