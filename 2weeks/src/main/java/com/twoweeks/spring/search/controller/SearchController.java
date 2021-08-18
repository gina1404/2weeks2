package com.twoweeks.spring.search.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.twoweeks.spring.search.model.vo.DummyData;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService service;
	
	//전체 검색 결과
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
	@RequestMapping("/update/blogDummy")
	public void updateBlogDummy(String searchKeyword) {
		//크롤링한 데이터를 받아서 ListMap에 저장
//		String searchKeyword="백신질문";
		List<DummyData> list=service.getBlogDummy(searchKeyword);
		
		int result=0; //DB 저장 결과 확인용
		//List를 쪼개서 DB에 저장할 map을 나누어 보냄
		for(int i=0; i<list.size(); i++) {
			result+=service.insertBlogDummy(list.get(i));
		}
		System.out.println(result>0?"커뮤니티 크롤링 데이터 저장 : 성공":"커뮤니티 크롤링황 데이터 저장 : 실패");
	}
	
}

