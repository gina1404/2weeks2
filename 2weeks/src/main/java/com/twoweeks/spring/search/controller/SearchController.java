package com.twoweeks.spring.search.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mchange.v2.sql.filter.SynchronizedFilterDataSource;
import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.common.Pagination;
import com.twoweeks.spring.search.model.service.SearchService;
import com.twoweeks.spring.search.model.vo.DummyData;

import kr.co.shineware.nlp.komoran.constant.DEFAULT_MODEL;
import kr.co.shineware.nlp.komoran.core.Komoran;
import kr.co.shineware.nlp.komoran.model.KomoranResult;

@Controller
public class SearchController {
	
	@Autowired	
	private SearchService service;
	

	//형태소 분석
	public static List<String> analyzeKeyword(String searchKeyword) {
		Komoran komoran = new Komoran(DEFAULT_MODEL.FULL);
		KomoranResult analyzedKeyword = komoran.analyze(searchKeyword);
		//System.out.println(analyzedKeyword.getTokenList());
		List<String> nounList = analyzedKeyword.getNouns();
		return nounList;
	}
	
	//전체 검색 결과
	@RequestMapping(value="/searchResult.do", method=RequestMethod.GET)
	public ModelAndView searchResult(String searchKeyword) {
		System.err.println("검색어 : "+searchKeyword);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("search/searchResult");
		mv.addObject("searchKeyword",searchKeyword);
		List<String> nounList = analyzeKeyword(searchKeyword); //형태소 분석 후 명사만 추출
//		System.out.println(nounList);
		
		if(!nounList.isEmpty()) {
			//post검색
			List<FreeBoard> searchResultCommunity = service.searchResultCommunity(nounList); 			
			if (searchResultCommunity!=null) mv.addObject("searchResultCommunity", searchResultCommunity);
		}
		int totalData=service.selectResultComCount(nounList);
		mv.addObject("searchResultCommunityCount", totalData);
		
		List<Map<String,String>> externalNaver = service.searchExternalNaver(searchKeyword);		
		mv.addObject("searchResultExternalNaver", externalNaver);
//		System.out.println("검색 결과 : "+service.searchExternalNaver(searchKeyword));
		return mv;
	}		
	
	//커뮤니티 상세 검색 결과
	@RequestMapping(value="/searchResult/community.do", method=RequestMethod.GET)
	public ModelAndView searchResultCommunity(@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage", defaultValue="5") int numPerpage, ModelAndView mv, String searchKeyword) throws IOException {
		if(searchKeyword.contains("?")) {
			System.out.println(searchKeyword);
			cPage=Integer.parseInt(searchKeyword.substring(searchKeyword.lastIndexOf("=")+1));
			System.out.println(cPage);
			searchKeyword=searchKeyword.substring(0, searchKeyword.indexOf("?"));
		}
		//mv.addObject("searchKeyword",searchKeyword);
		
		List<String> nounList = analyzeKeyword(searchKeyword); //형태소 분석 후 명사만 추출
		//System.out.println("검색어"+searchKeyword);
		
		System.out.println(cPage);
		
		if(!nounList.isEmpty()) {
			//post검색
			List<FreeBoard> searchResultCom = service.searchResultCom(cPage, numPerpage, nounList);
			int totalData=service.selectResultComCount(nounList);
			System.out.println(totalData);
			if (searchResultCom!=null) {
				mv.addObject("totalContents",totalData);
				mv.addObject("searchResultCom", searchResultCom);
				mv.addObject("pageBar", Pagination.getPageBar(totalData, cPage, numPerpage, "community.do?searchKeyword="+searchKeyword, null));
			}
		}

		mv.setViewName("search/searchResultCommunity");
		return mv;
	}
	
	//커뮤니티 데이터 크롤링 - Daum 블로그
	//@RequestMapping("/update/blogDummy")
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
	
	//메인 페이지용 검색
	@RequestMapping(value="/search4Home.do", method=RequestMethod.GET)
	@ResponseBody
	public Object search4home() {
		String searchKeyword="코로나 백신 자가격리 마스크";
		System.err.println("검색어 : "+searchKeyword);
		ModelAndView mv=new ModelAndView();
		
		List<String> nounList = analyzeKeyword(searchKeyword); //형태소 분석 후 명사만 추출
//		System.out.println(nounList);
		
		//post검색
		List<FreeBoard> searchResultCommunity = service.searchResultCommunity(nounList);
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchResultCommunity", searchResultCommunity);
		return m;
	}
	
}

