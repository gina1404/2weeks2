package com.twoweeks.spring.covid.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CovidUpdateController {
	
	@RequestMapping("/covid/domestic.do")
	public String openDomesticPage(){
		return "covidUpdate/domestic";
	}
}
