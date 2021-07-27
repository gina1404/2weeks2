package com.twoweeks.spring.covid.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.twoweeks.spring.common.CovidCenterExcelRead;
import com.twoweeks.spring.covid.report.model.vo.Center;

@Controller
public class CovidCenterController {

	@RequestMapping("/covidInfo/center.do")
	public String covidCenterList(HttpServletRequest req) {
		
		CovidCenterExcelRead excelReader=new CovidCenterExcelRead();
		System.out.println("======xls=====");
		String path=req.getServletContext().getRealPath("/resources/upload/covidCenterList.xls");
		List<Center> list= excelReader.xlsToCenterList(path);
		printList(list);	
		
		return "covidInfo/covidCenter";
	}
	
	public static void printList(List<Center> list) {
		Center c;
		for(int i=0; i<list.size(); i++) {
			c=list.get(i);
			System.out.println(c.toString());
		}
	}
	
	
//	@RequestMapping("/covidInfo/center.do")
//	public String covidCenterList() {
//		return "covidInfo/covidCenter";
//	}
	
	
	
	
	
	
}
