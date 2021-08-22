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

	//뉴스 데이터 가져오기
	@Override
	public List<CovidNews> getNewsList() {
		
		return dao.getNewsList(session);
	}

	@Override
	public List<CovidNews> list(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.list(session, cPage, numPerpage);
	}

	//pageBar를 생성하기 위한 총 뉴스 데이터 갯수를 불러온다.
	@Override
	public int totalNewsCount() {
		return dao.totalNewsCount(session);
	}

	@Override
	public List<CovidNews> postThree() {
		return dao.postThree(session);
	}

	
	
}
