package com.twoweeks.spring.covid.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.twoweeks.spring.covid.domestic.model.Service.CovidDomesticService;
import com.twoweeks.spring.covid.domestic.model.vo.Item;
import com.twoweeks.spring.covid.domestic.model.vo.Response;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class CovidUpdateController {
	
	@Autowired
	private CovidDomesticService service;
	
	@RequestMapping("covid/domestic.do")
	public ModelAndView openDomesticPage(ModelAndView mv){
		ResponseEntity<String> responseEntity = service.getApi();
		Response response = service.parser(responseEntity.getBody());
		List<Item> items = response.getBody().getItems();
		mv.addObject("items",items);
		
		String cd = items.get(0).getCreateDt();
		cd = cd.substring(0, cd.length()-4);
		
		mv.addObject("day",cd);
		
		mv.setViewName("covidUpdate/domestic");
		return mv;
	}
	
	@RequestMapping(value = "covid/getNumber", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String getNumber() {
		Gson gson = new Gson();

		List<Item> list = service.getNumber();
		
		
		
		return  gson.toJson(list);
	}
	@RequestMapping(value = "covid/getToday", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String getToday(Locale locale) {
		Gson gson = new Gson();
		
		List<Integer> today = service.getToday();
		
		System.out.println(today);
		
		return  gson.toJson(today);
	}
	
	

	
	
	
}
