package com.twoweeks.spring.covid.report.model.service;

import java.io.IOException;
import java.util.List;

import com.twoweeks.spring.covid.report.model.vo.NewsReport;

public interface CovideReportListService {

	//int insertReportList() throws IOException;
	
	List<NewsReport> reportList(int cPage, int numPerpage) throws IOException;
	
	int selectReportCount();	
	
}
