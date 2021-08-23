package com.twoweeks.spring.covid.domestic.model.Service;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;

import com.twoweeks.spring.covid.domestic.model.vo.Item;
import com.twoweeks.spring.covid.domestic.model.vo.Response;


public interface CovidDomesticService {
	
	ResponseEntity<String> getApi();
	Response parser(String xml);
	String getGoodBye();
	ResponseEntity<String> kCovidDataSave();
	int kCovidDataInsert(Map<String, Integer> param2);
	List<Item> getNumber();
	int getToday();
	int getTodayDecide();
}