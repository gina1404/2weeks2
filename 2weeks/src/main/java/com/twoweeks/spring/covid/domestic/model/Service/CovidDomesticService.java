package com.twoweeks.spring.covid.domestic.model.Service;

import org.json.simple.JSONArray;
import org.springframework.http.ResponseEntity;

import com.twoweeks.spring.covid.domestic.model.vo.Response;

import net.sf.json.JSONObject;

public interface CovidDomesticService {
	
	ResponseEntity<String> getApi();
	Response parser(String xml);
	String getGoodBye();
}