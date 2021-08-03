package com.twoweeks.spring.covid.report.model.service;

import java.util.ArrayList;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twoweeks.spring.common.CovidCenterExcelRead;
import com.twoweeks.spring.covid.report.model.dao.CovidReportListDaoImpl;
import com.twoweeks.spring.covid.report.model.vo.Center;
import com.twoweeks.spring.covid.report.model.vo.NewsReport;

import lombok.Getter;
import lombok.Setter;

@Service
public class CovideReportListServiceImpl implements CovideReportListService{		
	
	@Autowired
	private SqlSession session;
	@Autowired
	private CovidReportListDaoImpl dao;
	
	List<NewsReport> reportList=new ArrayList();
	
//	@Override
//	@PostConstruct
//	public int insertReportList() throws IOException {
//		int result=0;
//		for(int i=1; i<=7; i++) { //총 273페이지. 1페이지=6게시글
//			String reportUrl="http://ncov.mohw.go.kr/tcmBoardList.do?pageIndex="+i+"&brdId=3&brdGubun=&board_id=&search_item=1&search_content=";
//					
//			Document doc=Jsoup.connect(reportUrl).get();	
//			
//			Elements elem=doc.select("table tbody tr"); 
//			
//			for(Element content : elem) {
//				Elements tdElem=content.select("td");
//				
//				NewsReport report=NewsReport.builder().
//						no(Integer.parseInt(tdElem.get(0).text())).
//						title(tdElem.get(1).text()).
//						team(tdElem.get(2).text()).	
//						date(tdElem.get(3).text()).
//						attachment(tdElem.get(4).text()).build();
//				
//				//System.out.println(report);
//				result=dao.insertReportList(session, report);				
//			}
//		}	
//		return result;
//	}
	
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
