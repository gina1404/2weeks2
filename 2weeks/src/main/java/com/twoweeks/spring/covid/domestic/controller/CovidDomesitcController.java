package com.twoweeks.spring.covid.domestic.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.covid.domestic.model.Service.CovidDomesticService;
import com.twoweeks.spring.covid.domestic.model.vo.Item;
import com.twoweeks.spring.covid.domestic.model.vo.Response;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class CovidDomesitcController {

	
	@Autowired
	private CovidDomesticService service;
	
	@GetMapping("/covidUpdate/domestic.do")
	public ModelAndView domesticTrend(ModelAndView mv) {
		mv.setViewName("domestic/domesticList");
		return mv;
	}
	
	
	@RequestMapping("/domestic/cases/")
	public ModelAndView cases(ModelAndView mv) {
		
	log.info("case 실행중입니다 ");
	
	Date day = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	
	
	ResponseEntity<String> responseEntity = service.getApi();
	Response response = service.parser(responseEntity.getBody());
	System.out.println(responseEntity.getBody());
	
	
	String json= service.getGoodBye();
	
	
	
	log.info("json : " + json);
	System.out.println(json.toString());
	List<Item> items = response.getBody().getItems();
	mv.addObject("decide",items.get(0).getDecideCnt()); //확진자 수
	mv.addObject("death",items.get(0).getDeathCnt()); //사망자 수
	mv.addObject("json",json);
	//뒤에 소수점 .xxx가 붙어서 맨뒤에서 부터 4글자를 삭제해줌
	String cd = items.get(0).getCreateDt();
	cd = cd.substring(0, cd.length()-4);
	

	
	mv.addObject("day",cd); //기준일
	System.out.println(items.toString());
	
	mv.setViewName("domestic/domesticList");
	return mv;
	}
}
