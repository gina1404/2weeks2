package com.twoweeks.spring.covid.report.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.twoweeks.spring.covid.report.model.vo.NewsReport;

public interface CovidReportListDao {

	int insertReportList(SqlSession session, NewsReport report);
	
	List<NewsReport> selectReportList(SqlSession session, int cPage, int numPerpage);
	
	int reportListCount(SqlSession session);
}
