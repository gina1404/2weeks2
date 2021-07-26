package com.twoweeks.spring.overseas.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.twoweeks.spring.overseas.model.sevice.CovidOverseasService;
import com.twoweeks.spring.overseas.model.vo.Item;
import com.twoweeks.spring.overseas.model.vo.Response;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CovidOverseasController {
	
	@Autowired
	private CovidOverseasService service;
	
	@RequestMapping("/covid/overseas.do")
	public ModelAndView OverseasList(ModelAndView mv) {
		ResponseEntity<String> responseEntity = service.getApi();
		Response response = service.parser(responseEntity.getBody());
		
		List<Item> items = response.getBody().getItems();
		
		mv.addObject("items", items);
		mv.setViewName("covidUpdate/overseas");
		return mv;
	}

}
