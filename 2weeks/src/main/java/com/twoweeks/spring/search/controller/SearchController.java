package com.twoweeks.spring.search.controller;

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
	public ModelAndView searchResut(@RequestParam(required=false)String searchKeyword) {
		System.out.println(searchKeyword);
		ModelAndView mv=new ModelAndView();
		mv.addObject("searchKeyword", searchKeyword);
		mv.addObject("searchResult-community",1);
		mv.addObject("serchResult-knowledgeIn",2);
		mv.addObject("searchResult-external-naver", service.searchExternalNaver(searchKeyword));
		return mv;
	}

}
