package com.twoweeks.spring.covid.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.twoweeks.spring.common.CovidCenterExcelRead;
import com.twoweeks.spring.covid.report.model.service.CovideReportListServiceImpl;
import com.twoweeks.spring.covid.report.model.vo.Center;

@Controller
public class CovidCenterController {

	@Autowired
	private CovideReportListServiceImpl service;
	
	@RequestMapping("/covidInfo/center.do")
	public String covidCenterList(HttpServletRequest req, Model m) {
		//엑셀데이터 추출 후 DB에 저장하기
//		int result=0;
//		CovidCenterExcelRead excelReader=new CovidCenterExcelRead();
//		
//		String path=req.getServletContext().getRealPath("/resources/upload/covidCenterList.xls");
//		List<Center> centerList= excelReader.xlsToCenterList(path);		
//		
//		for(Center c : centerList) {
//			result=service.insertCenterList(c);
//		}
//		if(result>0) return "covidInfo/covidCenter";
//		else return "";	
		
		//엑셀데이터 DB에서 불러오기
		List<Center> list=service.selectCenterList();
		
		m.addAttribute("list", list);
		
		return "covidInfo/covidCenter";
	}
	
	public static void printList(List<Center> list) {
		Center c;
		for(int i=0; i<list.size(); i++) {
			c=list.get(i);
			System.out.println(c.toString());
		}
	}
	
	
	
	
	
	
}
