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

import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.covid.domestic.model.Service.CovidDomesticService;
import com.twoweeks.spring.covid.report.model.service.CovideReportListServiceImpl;
import com.twoweeks.spring.overseas.model.sevice.CovidOverseasService;
import com.twoweeks.spring.overseas.model.vo.Item;
import com.twoweeks.spring.overseas.model.vo.OverseasPie;
import com.twoweeks.spring.overseas.model.vo.Response;
import com.twoweeks.spring.search.model.service.SearchService;

import kr.co.shineware.nlp.komoran.constant.DEFAULT_MODEL;
import kr.co.shineware.nlp.komoran.core.Komoran;
import kr.co.shineware.nlp.komoran.model.KomoranResult;

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
	@Autowired
	private CovidDomesticService dService;
	
	@Autowired	
	private SearchService searchService;
	
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
		
		//커뮤니티 검색 결과 출력용
		String searchKeyword="코로나 백신 자가격리 마스크";
		System.err.println("검색어 : "+searchKeyword);
		List<String> nounList = analyzeKeyword(searchKeyword); //형태소 분석 후 명사만 추출
		List<FreeBoard> searchResultCommunity = searchService.searchResultCommunity(nounList);
		model.addAttribute("searchResultCommunity", searchResultCommunity);
		//커뮤니티 검색 결과 출력 끝
		
		
		
		//금일 확진자, 총 사망자, 총 확진자, 총 검사수, 
		int today = dService.getTodayDecide();
		ResponseEntity<String> res = dService.getApi();
		com.twoweeks.spring.covid.domestic.model.vo.Response r = dService.parser(res.getBody());
		List<com.twoweeks.spring.covid.domestic.model.vo.Item> items = r.getBody().getItems();
		System.out.println(items.get(0).getDeathCnt());
		model.addAttribute("decideCnt",items.get(0).getDecideCnt());
		model.addAttribute("deathCnt",items.get(0).getDeathCnt());
		model.addAttribute("clearCnt",items.get(0).getClearCnt());
		
		model.addAttribute("todayDecide", today);
		/////////////////////////////////////////////////////////////////
		
		return "index";
	}
	
	//형태소 분석
		public static List<String> analyzeKeyword(String searchKeyword) {
			Komoran komoran = new Komoran(DEFAULT_MODEL.FULL);
			KomoranResult analyzedKeyword = komoran.analyze(searchKeyword);
			//System.out.println(analyzedKeyword.getTokenList());
			List<String> nounList = analyzedKeyword.getNouns();
			return nounList;
		}
		
		
	
	
}
