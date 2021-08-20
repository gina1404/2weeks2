package com.twoweeks.spring;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.twoweeks.spring.covid.report.model.service.CovideReportListServiceImpl;
import com.twoweeks.spring.overseas.model.sevice.CovidOverseasService;
import com.twoweeks.spring.overseas.model.vo.Item;
import com.twoweeks.spring.overseas.model.vo.OverseasPie;
import com.twoweeks.spring.overseas.model.vo.Response;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private CovideReportListServiceImpl reportService;
	@Autowired
	private CovidOverseasService service;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		
		ResponseEntity<String> responseEntity = service.getApi();
		Response response = service.parser(responseEntity.getBody());

		List<Item> list = response.getBody().getItems();
		DecimalFormat formatter = new DecimalFormat("###,###");
		List<OverseasPie> pielist = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getNationNmEn().equals("United States of America")) {
				OverseasPie op1 = new OverseasPie();
				op1.setNationNm("미국");
				op1.setDefCount(list.get(i).getNatDefCnt());
				pielist.add(op1);
			} else if (list.get(i).getNationNmEn().equals("Japan")) {
				OverseasPie op1 = new OverseasPie();
				op1.setNationNm("일본");
				op1.setDefCount(list.get(i).getNatDefCnt());
				pielist.add(op1);
			} else if (list.get(i).getNationNmEn().equals("United Kingdom")) {
				OverseasPie op1 = new OverseasPie();
				op1.setNationNm("영국");
				op1.setDefCount(list.get(i).getNatDefCnt());
				pielist.add(op1);
			} else if (list.get(i).getNationNmEn().equals("France")) {
				OverseasPie op1 = new OverseasPie();
				op1.setNationNm("프랑스");
				op1.setDefCount(list.get(i).getNatDefCnt());
				pielist.add(op1);
			} else if (list.get(i).getNationNmEn().equals("Germany")) {
				OverseasPie op1 = new OverseasPie();
				op1.setNationNm("독일");
				op1.setDefCount(list.get(i).getNatDefCnt());
				pielist.add(op1);
			} else if (list.get(i).getNationNmEn().equals("Italy")) {
				OverseasPie op1 = new OverseasPie();
				op1.setNationNm("이탈리아");
				op1.setDefCount(list.get(i).getNatDefCnt());
				pielist.add(op1);
			} else if (list.get(i).getNationNmEn().equals("Canada")) {
				OverseasPie op1 = new OverseasPie();
				op1.setNationNm("캐나다");
				op1.setDefCount(list.get(i).getNatDefCnt());
				pielist.add(op1);
			}
		}
		/* System.out.println(pielist); */
		model.addAttribute("pielist",pielist);
		
		model.addAttribute("serverTime", formattedDate );
		
		model.addAttribute("reportList", reportService.reportList(1, 14));
		
		return "index";
	}
	
}
