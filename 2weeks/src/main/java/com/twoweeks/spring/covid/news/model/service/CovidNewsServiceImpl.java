package com.twoweeks.spring.covid.news.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twoweeks.spring.covid.news.model.dao.CovidNewsDao;
import com.twoweeks.spring.covid.news.model.vo.CovidNews;

@Service
public class CovidNewsServiceImpl implements CovidNewsService {

	@Autowired
	private SqlSession session;
	
	@Autowired
	private CovidNewsDao dao;
	
	//뉴스크롤링 데이터 db에 저장
	@Override
	public int covidNewsData(Map<String, String> param) {
		return dao.covidNewsData(param, session);
	}

	
	
}
