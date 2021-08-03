package com.twoweeks.spring.covid.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	}

	
	
}
