package com.twoweeks.spring;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.covid.report.model.service.CovideReportListServiceImpl;
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
		
		model.addAttribute("serverTime", formattedDate );
		
		model.addAttribute("reportList", reportService.reportList(1, 14));
		
		//커뮤니티 검색 결과 출력용
		String searchKeyword="코로나 백신 자가격리 마스크";
		System.err.println("검색어 : "+searchKeyword);
		List<String> nounList = analyzeKeyword(searchKeyword); //형태소 분석 후 명사만 추출
		List<FreeBoard> searchResultCommunity = searchService.searchResultCommunity(nounList);
		model.addAttribute("searchResultCommunity", searchResultCommunity);
		//커뮤니티 검색 결과 출력 끝
		
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
