package com.twoweeks.spring.covid.domestic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.covid.domestic.model.Service.CovidDomesticService;
import com.twoweeks.spring.covid.domestic.model.vo.Item;
import com.twoweeks.spring.covid.domestic.model.vo.Response;

@RestController
public class CovidDomesitcController {

	
	@Autowired
	private CovidDomesticService covidDomesticService;
	
	@GetMapping("/domestic/domesticTrend.do")
	public ModelAndView domesticTrend(ModelAndView mv) {
		ResponseEntity<String> responseEntity = covidDomesticService.getApi();
		Response response = covidDomesticService.parser(responseEntity.getBody());
		
		List<Item> items = response.getBody().getItems();
		
		
		return mv;
	}
	
}
