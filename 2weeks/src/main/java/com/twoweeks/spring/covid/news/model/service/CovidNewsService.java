package com.twoweeks.spring.covid.news.model.service;

import java.util.List;
import java.util.Map;

import com.twoweeks.spring.covid.news.model.vo.CovidNews;

public interface CovidNewsService {

	
	int covidNewsData(Map<String, String> param);

	List<CovidNews> getNewsList();

	List<CovidNews> list(int cPage, int numPerpage);

	int totalNewsCount();
	
}
