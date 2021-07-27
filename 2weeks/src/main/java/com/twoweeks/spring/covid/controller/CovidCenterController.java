package com.twoweeks.spring.covid.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CovidCenterController {

	@RequestMapping("/covidInfo/center.do")
	public String covidCenterList() {
		
		
		
		
		
		
		return "covidInfo/covidCenter";
	}
	
	
//	@RequestMapping("/covidInfo/center.do")
//	public String covidCenterList() {
//		return "covidInfo/covidCenter";
//	}
	
	
	
	
	
	
}
