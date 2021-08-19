package com.twoweeks.spring.covid.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.common.PageFactory;
import com.twoweeks.spring.covid.report.model.service.CovideReportListServiceImpl;

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
//		for(int i=1; i<=11; i++) { //총 273페이지. 1페이지=6게시글
//			String reportUrl="http://ncov.mohw.go.kr/tcmBoardList.do?pageIndex="+i+"&brdId=3&brdGubun=&board_id=&search_item=1&search_content=";
//					
//			Document doc=Jsoup.connect(reportUrl).get();	
//			
//			Elements elem=doc.select("table tbody tr");
//						
//			NewsReport report=new NewsReport();
//			
//			for(Element content : elem) {
//				Elements tdElem=content.select("td");				
//				Elements links = content.getElementsByClass("bl_link");
//				for (Element link : links) {
//					String onclick = link.attr("onclick");
//					report=NewsReport.builder().
//							no(Integer.parseInt(tdElem.get(0).text())).
//							title(tdElem.get(1).text()).
//							team(tdElem.get(2).text()).	
//							date(tdElem.get(3).text()).
//							attachment(tdElem.get(4).text()).
//							url(onclick).build();									
//				}							
//				result=service.insertReportList(report);				
//			}
//		}
//		return mv;
		
		/*
		http://ncov.mohw.go.kr/
			tcmBoardView.do? --1
					brdId=3& --2
					brdGubun=31& --3
					dataGubun=& ****
					ncvContSeq=5843& --4 ****
					contSeq=5843& --4
					board_id=312& --5 **140
					gubun=BDJ
		http://ncov.mohw.go.kr/
			tcmBoardView.do?
					brdId=&//
					brdGubun=&//
					dataGubun=&//
					ncvContSeq=366895&
					contSeq=366895&//
					board_id=140&//
					gubun=BDJ
		http://ncov.mohw.go.kr/tcmBoardView.do?brdId=&brdGubun=&dataGubun=366856&ncvContSeq=366856&contSeq=5693&board_id=&gubun=BDJ
		http://ncov.mohw.go.kr/tcmBoardView.do?brdId=&brdGubun=&dataGubun=&ncvContSeq=366856&contSeq=366856&board_id=140&gubun=BDJ
		
		http://ncov.mohw.go.kr/tcmBoardView.do?brdId=3&brdGubun=31&dataGubun=&ncvContSeq=5830&contSeq=5830&board_id=312&gubun=BDJ
		http://ncov.mohw.go.kr/tcmBoardView.do?brdId=&brdGubun=&dataGubun=&ncvContSeq=366865&contSeq=366865&board_id=140&gubun=BDJ
		http://ncov.mohw.go.kr/tcmBoardView.do?brdId=3&brdGubun=31&dataGubun=&ncvContSeq=5820&contSeq=5820&board_id=312&gubun=BDJ
		
		http://ncov.mohw.go.kr/
			tcmBoardView.do?
					brdId=3&
					brdGubun=31&
					dataGubun=&
					ncvContSeq=5821&
					contSeq=5821&//
					board_id=313&//
					gubun=BDJ
		
		*/
		
	}
}
