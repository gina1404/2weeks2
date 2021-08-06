package com.twoweeks.spring.search.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

}
