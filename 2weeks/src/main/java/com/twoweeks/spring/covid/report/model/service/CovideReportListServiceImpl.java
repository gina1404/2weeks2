package com.twoweeks.spring.covid.report.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twoweeks.spring.covid.report.model.dao.CovidReportListDaoImpl;
import com.twoweeks.spring.covid.report.model.vo.Center;
import com.twoweeks.spring.covid.report.model.vo.NewsReport;

@Service
public class CovideReportListServiceImpl implements CovideReportListService{		
	
	@Autowired
	private SqlSession session;
	@Autowired
	private CovidReportListDaoImpl dao;
	
	List<NewsReport> reportList=new ArrayList();
	
	@Override	
	public int insertReportList(NewsReport report){
		return dao.insertReportList(session, report);		
	}
	
	@Override
	public List<NewsReport> reportList(int cPage, int numPerpage){		
		return dao.selectReportList(session, cPage, numPerpage);			
	}
	
	@Override
	public int selectReportCount() {
		return dao.reportListCount(session);
	}
	
	/////////////////////////
	//////////center/////////
	@Override	
	public int insertCenterList(Center c) {
		int result=dao.insertCenterList(session, c);		
		return result;
	}

	@Override
	public List<Center> selectCenterList() {
		return dao.selectCenterList(session);
	}
		
}
