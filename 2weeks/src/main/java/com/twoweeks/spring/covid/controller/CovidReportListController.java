package com.twoweeks.spring.covid.controller;

import java.io.IOException;
import java.util.HashMap;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CovidReportListController {

	public static HashMap<String, String> map;
	
	@RequestMapping("/covidUpdate/report.do")
	public String reportList(Model m) {
		//Document : Jsoup으로 얻어온 결과 HTML 전체 문서
		//Element : Document의 HTML요소
		//Elements : Element가 모인 자료형, for나 while 등 반복문 사용 가능
		//Conection : Jsoup의 Connect 혹은 설정 매소드들을 이용해 만들어지는 객체, 연결하기 위한 정보를 담고 있음.
		String reportUrl="http://ncov.mohw.go.kr/tcmBoardList.do?brdId=3&brdGubun=";
		Document doc=null;
		
		try {
			doc=Jsoup.connect(reportUrl).get();			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		Elements elem=doc.select("table tbody tr");
		String no=elem.select("td").eq(0).text();
		
		System.out.println("no "+no);
		System.out.println(elem);
		
		m.addAttribute("elem", elem);
		
		return "covidUpdate/reportList";
	}

	
	
}
