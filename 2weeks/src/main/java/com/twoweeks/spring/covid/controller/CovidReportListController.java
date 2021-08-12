package com.twoweeks.spring.covid.controller;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.common.PageFactory;
import com.twoweeks.spring.covid.report.model.service.CovideReportListServiceImpl;
import com.twoweeks.spring.covid.report.model.vo.NewsReport;

@Controller
public class CovidReportListController{

	@Autowired
	private  CovideReportListServiceImpl service;
		
	@RequestMapping("/covidUpdate/report.do")
	public ModelAndView reportList(@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage", defaultValue="10") int numPerpage,
			ModelAndView mv) throws IOException{		
		mv.addObject("reportList", service.reportList(cPage, numPerpage));
		int totalData=service.selectReportCount();		
		mv.addObject("totalContents", totalData);
				
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage, "report.do"));
		
		mv.setViewName("covidUpdate/newsReportList");
		return mv;
		
		//보도자료 크롤링 DB에 저장시키기
//		int result=0;
//		for(int i=1; i<=10; i++) { //총 273페이지. 1페이지=6게시글
//			String reportUrl="http://ncov.mohw.go.kr/tcmBoardList.do?pageIndex="+i+"&brdId=3&brdGubun=&board_id=&search_item=1&search_content=";
//					
//			Document doc=Jsoup.connect(reportUrl).get();	
//			
//			Elements elem=doc.select("table tbody tr");
//						
//			for(Element content : elem) {
//				Elements tdElem=content.select("td");
//				//System.out.println("1   "+tdElem.select("a"));
//				//System.out.println("2   "+tdElem.get(1).text());
//				
//				NewsReport report=NewsReport.builder().
//						no(Integer.parseInt(tdElem.get(0).text())).
//						title(tdElem.get(1).text()).
//						team(tdElem.get(2).text()).	
//						date(tdElem.get(3).text()).
//						attachment(tdElem.get(4).text()).build();
//				
//				//System.out.println(report);
//				//result=service.insertReportList(report);				
//			}
//		}
//		return mv;
		
		
	}
}
