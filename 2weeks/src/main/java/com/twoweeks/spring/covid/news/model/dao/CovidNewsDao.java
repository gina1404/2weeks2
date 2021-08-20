package com.twoweeks.spring.covid.news.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.twoweeks.spring.covid.news.model.vo.CovidNews;

public interface CovidNewsDao {

	//뉴스크롤링 데이터 db에 저장
	int covidNewsData(Map<String, String> param, SqlSession session);

	List<CovidNews> getNewsList(SqlSession session);

	List<CovidNews> list(SqlSession session, int cPage, int numPerpage);

	int totalNewsCount(SqlSession session);

}
