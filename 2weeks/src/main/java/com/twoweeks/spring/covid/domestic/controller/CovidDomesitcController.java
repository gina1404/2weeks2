package com.twoweeks.spring.covid.domestic.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.covid.domestic.model.service.CovidDomesticService;
import com.twoweeks.spring.covid.domestic.model.vo.Item;
import com.twoweeks.spring.covid.domestic.model.vo.Response;

@RestController
public class CovidDomesitcController {

	
	@Autowired
	private CovidDomesticService covidDomesticService;
	
	@GetMapping("/covidUpdate/domestic.do")
	public ModelAndView domesticTrend(ModelAndView mv) {
		ResponseEntity<String> responseEntity = covidDomesticService.getApi();
		Response response = covidDomesticService.parser(responseEntity.getBody());
		System.out.println(responseEntity.getBody());
		System.out.println(responseEntity);
		List<Item> items = response.getBody().getItems();
		mv.addObject("decide",items.get(0).getDecideCnt()); //확진자 수
		mv.addObject("death",items.get(0).getDeathCnt()); //사망자 수
		mv.addObject("state",items.get(0).getStateDt()); //기준일
		System.out.println(items.toString());
		mv.setViewName("domestic/map");
		return mv;
	}
	
}
