package com.twoweeks.spring.covid.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.covid.domestic.model.Service.CovidDomesticService;
import com.twoweeks.spring.covid.domestic.model.vo.Item;
import com.twoweeks.spring.covid.domestic.model.vo.Response;

@Controller
public class CovidUpdateController {
	
	@Autowired
	private CovidDomesticService service;
	
	@RequestMapping("/covid/domestic.do")
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
}
