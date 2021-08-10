package com.twoweeks.spring.search.controller;

import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.search.model.service.SearchService;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService service;
	
	@RequestMapping(value="/searchResult.do", method=RequestMethod.GET)
	public ModelAndView searchResut(String searchKeyword) {
		System.err.println("검색어 : "+searchKeyword);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("search/searchResult");
		mv.addObject("searchKeyword", searchKeyword);
		mv.addObject("searchResultCommunity","TEST");
		mv.addObject("searchResultKnowledgeIn","TEST2");
		
		List<Map<String,String>> externalNaver = service.searchExternalNaver(searchKeyword);
		mv.addObject("searchResultExternalNaver", externalNaver);
//		System.out.println("검색 결과 : "+service.searchExternalNaver(searchKeyword));
		return mv;
	}	

	
	//커뮤니티 데이터 크롤링 - Daum 블로그
	@RequestMapping("/update/communityDummy")
	public void updateCommunityDummyData(String searchKeyword) throws Exception {
		for(int i=0; i<=10; i++) { //페이지 반복
			String daumblogUrl="https://search.daum.net/search?w=blog&nil_search=btn&DA=NTB&enc=utf8&q="+searchKeyword+"&p="+i;
			Document doc=Jsoup.connect(daumblogUrl).get();
			Elements elem=doc.select("div.coll_cont ul li div.wrap_cont div.cont_inner");
	
			//데이터 전처리
			for(Element e : elem) {			
				String title=e.select("a.f_link_b").text();//제목
				String link=e.select("a.f_link_b").attr("href"); //게시글 링크		
				String content; //미리보기
				String update; //게시일	
				String writer; //작성자
							
				Document doc2=Jsoup.connect(link).get();
				writer=doc2.select("span.author").text();
				update=doc2.select("span.date").text();
				content=doc2.select(".tt_article_useless_p_margin").text();
				
				//값을 가져올 수 없는 경우
				if(content.isBlank()) content=e.select("p.f_eb.desc").text(); //미리보기로 대체
				if(update.isBlank()) update=e.select("span.f_nb.date").text();
				if(writer.isBlank()) writer="unknown";
				
				//writer 데이터 정제
				if(writer.contains("by")) writer=writer.substring(3);
				if(writer.contains(" ")) writer=writer.substring(0, writer.lastIndexOf(" "));
				if(update.contains(":")) update=update.substring(0, update.indexOf(":")-4);
				
				//날짜 변환
				Date newdate; //게시일 Date
				if(update.contains("전")||update.contains("어제")) {
					newdate=new Date();
				}else {
					SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
					newdate=new Date(sdf.parse(update).getTime());
				}
				
				//데이터 확인용
				System.out.println(title);
				System.out.println(content);
				System.out.println(newdate);
				System.out.println(writer);
				System.out.println("===============================");
				
			} //데이터 전처리 종료
		} //페이지 반복문 종료
	} //크롤링 컨트롤러 종료
	
	
}

