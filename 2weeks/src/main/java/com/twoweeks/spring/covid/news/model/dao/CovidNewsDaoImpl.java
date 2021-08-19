package com.twoweeks.spring.covid.news.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.twoweeks.spring.covid.news.model.vo.CovidNews;

@Repository
public class CovidNewsDaoImpl implements CovidNewsDao {

	//뉴스크롤링 데이터 db에 저장
	@Override
	public int covidNewsData(Map<String, String> param, SqlSession session) {
		return session.insert("covidnews.covidNewsData",param);
	}

	
	
}
