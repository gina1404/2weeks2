package com.twoweeks.spring.covid.domestic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	
	@RequestMapping("domestic/cases")
	public ModelAndView cases(ModelAndView mv) {
		
		ResponseEntity<String> responseEntity = service.getApi();
		Response response = service.parser(responseEntity.getBody());
		List<Item> items = response.getBody().getItems();

	
		String json =  service.getGoodBye();
		
	System.out.println(json.toString());
	
	mv.addObject("first",items); //확진자 수
	//mv.addObject("death",items.get(0).getSecondCnt()); //사망자 수
	mv.addObject("json");
	mv.addObject("items",items);
	//뒤에 소수점 .xxx가 붙어서 맨뒤에서 부터 4글자를 삭제해줌
	String cd = items.get(0).getCreateDt();
	cd = cd.substring(0, cd.length()-4);
	

	log.info(cd);
	mv.addObject("day",cd); //기준일
	System.out.println(items.toString());
	
	mv.setViewName("covidUpdate/domestic");
	return mv;
	}
}
