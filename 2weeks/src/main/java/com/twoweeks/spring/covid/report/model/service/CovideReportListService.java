package com.twoweeks.spring.covid.report.model.service;

import java.io.IOException;
import java.util.List;

import com.twoweeks.spring.covid.report.model.vo.Center;
import com.twoweeks.spring.covid.report.model.vo.NewsReport;

public interface CovideReportListService {

	int insertReportList(NewsReport report);
	
	List<NewsReport> reportList(int cPage, int numPerpage) throws IOException;
	
	int selectReportCount();
	
	int insertCenterList(Center c);
	
	List<Center> selectCenterList();
	
}
