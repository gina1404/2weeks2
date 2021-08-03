package com.twoweeks.spring.covid.domestic.model.Service;

import org.springframework.http.ResponseEntity;

import com.twoweeks.spring.covid.domestic.model.vo.Response;

public interface CovidDomesticService {
	
	ResponseEntity<String> getApi();
	Response parser(String xml);
}