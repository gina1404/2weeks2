package com.twoweeks.spring.search.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.know.model.vo.Kin;
import com.twoweeks.spring.search.model.vo.DummyData;


public interface SearchService {	
	//community 내부 검색
	List<FreeBoard> searchResultCommunity(List<String> nounList);
	
	//community 상세 검색
	List<FreeBoard> searchResultCom(int cPage, int numPerpage, List<String> nounList)  throws IOException;
	int selectResultComCount(List<String> nounList);
	
	//지식인 내부 검색
	List<Kin> searchResultKnowledgeIn(List<String> nounList);		
	
	//지식인 상세 검색
	List<Kin> searchResultKin(int cPage, int numPerpage, List<String> nounList)  throws IOException;
	int selectResultKinCount(List<String> nounList);
	
	//네이버 검색 결과 api
	List<Map<String,String>> searchExternalNaver(String searchKeyword);
	
	//다음 블로그 크롤링 데이터를 ListMap에 저장
	List<DummyData> getBlogDummy(String searchKeyword);	
	
	//map을 보내서 DB에 저장
	int insertBlogDummy(DummyData dd);
}
