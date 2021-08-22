package com.twoweeks.spring.covid.news.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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

	//뉴스 데이터 가져오기
	@Override
	public List<CovidNews> getNewsList(SqlSession session) {
		return session.selectList("covidnews.getNewsList");
	}

	@Override
	public List<CovidNews> list(SqlSession session, int cPage, int numPerpage) {
	
		return session.selectList("covidnews.list", null, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	@Override
	public int totalNewsCount(SqlSession session) {
	
		return session.selectOne("covidnews.totalNewsCount");
	}

	@Override
	public List<CovidNews> postThree(SqlSession session) {
	
		return session.selectList("covidnews.postThree");
	}

	
	
}
