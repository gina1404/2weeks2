package com.twoweeks.spring.covid.domestic.model.service;

import org.springframework.http.ResponseEntity;

import com.twoweeks.spring.covid.domestic.model.vo.Response;

public interface CovidDomesticService {
	
	ResponseEntity<String> getApi();
	Response parser(String xml);
}
