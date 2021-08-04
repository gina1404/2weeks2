package com.twoweeks.spring.covid.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CovidUpdateController {
	
	@RequestMapping("/covidUpdate/domestic.do")
	public String boardForm(){
		return "covidUpdate/domestic";
	}

	@RequestMapping("/covidUpdate/domesticVaccine.do")
	public String domesticVaccine(){

		
		return "covidUpdate/domesticVaccine";
	}
	
	
}
