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

	
	//커뮤니티 데이터 크롤릴용 - Daum
	@RequestMapping("/update/communityDummy")
	public void updateCommunityDummyData(String searchKeyword) throws Exception {
		for(int i=0; i<=10; i++) { //페이지 반복
			String daumblogUrl="https://search.daum.net/search?w=blog&nil_search=btn&DA=NTB&enc=utf8&q="+searchKeyword+"&p="+i;
			Document doc=Jsoup.connect(daumblogUrl).get();
			Elements elem=doc.select("div.coll_cont ul li div.wrap_cont div.cont_inner");
	
			//데이터 전처리
			for(Element e : elem) {			
				String title=e.getElementsByClass("wrap_tit mg_tit").text();//제목
				String link=e.getElementsByClass("f_link_b").attr("href"); //게시글 링크		
				String content; //=e.getElementsByClass("f_eb desc").text();//미리보기
				String update; //=e.getElementsByClass("f_nb date").text(); //게시일	
				String writer; //작성자
							
				Document doc2=Jsoup.connect(link).get();
				writer=doc2.select(".author").text();
				update=doc2.select(".date").text();
				content=doc2.select(".tt_article_useless_p_margin").text();
				
				//값을 가져올 수 없는 경우
				if(content.isBlank()) content=e.getElementsByClass("f_eb desc").text(); //미리보기로 대체
				if(update.isBlank()) update=e.getElementsByClass("f_nb date").text();
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
			} //데이터 전처리 종료
		} //페이지 반복문 종료
	} //크롤링 컨트롤러 종료

	
	//네이버 view 데이터 크롤링 - community 데이터 생성
//	@RequestMapping("/update/communityDummy")
//	public void updateCommunityDummyData(String searchKeyword) throws Exception {
//		String naverViewUrl="https://search.naver.com/search.naver?sm=tab_hty.top&where=view&query="+searchKeyword;
//		Document doc=Jsoup.connect(naverViewUrl).get();
//		Elements elem=doc.select("div.total_area");
//		for(Element e : elem) {
//			String title=e.getElementsByClass("api_txt_lines total_tit").text();//제목
//			String link=e.getElementsByClass("api_txt_lines total_tit").attr("href");
//			
//			String content=e.getElementsByClass("api_txt_lines dsc_txt").text();//미리보기
//			String update=e.getElementsByClass("sub_time").text(); //게시일	
//			Date newdate;
//			if(update.contains("전")||update.contains("어제")) {
//				newdate=new Date();
//			}else {
//				SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
//				newdate=new Date(sdf.parse(update).getTime());
//			}						
//			System.out.println(title);
//			System.out.println(content);
//			System.out.println(newdate);
//			System.out.println(link);
//			
//			//카페, 블로그 글 본문 가져오기
//			/*
//			 * Document doc2=Jsoup.connect(link).get(); if(link.contains("blog")) { //블로그 글
//			 * System.out.println(doc2.select("div"));
//			 * content=doc2.select("div.se-main-container").text(); System.out.println(1);
//			 * }else if(link.contains("cafe")){ //카페 글
//			 * System.out.println(doc2.select("div.article_container"));
//			 * content=doc2.select("div.article_container").text(); System.out.println(2);
//			 * }else { //post 글
//			 * 
//			 * }
//			 */
//			//System.out.println(content);
//			System.out.println("=================================");
//		}
//	}
}

