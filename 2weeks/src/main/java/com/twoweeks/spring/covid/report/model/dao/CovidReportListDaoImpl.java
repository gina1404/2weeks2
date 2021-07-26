package com.twoweeks.spring.covid.report.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.twoweeks.spring.covid.report.model.vo.NewsReport;

@Repository
public class CovidReportListDaoImpl implements CovidReportListDao{

	@Override
	public int insertReportList(SqlSession session, NewsReport report) {
		return session.insert("newsReport.insertReport", report);
	}

	@Override
	public List<NewsReport> selectReportList(SqlSession session, int cPage, int numPerpage) {		
		return session.selectList("newsReport.selectReportList", null, 
									new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	@Override
	public int reportListCount(SqlSession session) {
		return session.selectOne("newsReport.reportListCount");
	}

	
	
}
