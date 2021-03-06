package com.twoweeks.spring.search.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.know.model.vo.Kin;
import com.twoweeks.spring.search.model.vo.DummyData;
import com.twoweeks.spring.search.model.vo.SearchNoun;

public interface SearchDao {

	//community 내부 검색 결과
	List<FreeBoard> searchResultCommunity(SqlSessionTemplate session, SearchNoun sn);
	
	//community 상세 검색
	List<FreeBoard> selectResultCom(SqlSessionTemplate session, int cPage, int numPerpage, SearchNoun sn);
	int selectResultComCount(SqlSessionTemplate session, SearchNoun sn);
	
	//지식인 내부 검색 결과
	List<Kin> searchResultkNowledgeIn(SqlSessionTemplate session, SearchNoun sn);
	
	//지식인 상세 검색
	List<Kin> selectResultKin(SqlSessionTemplate session, int cPage, int numPerpage, SearchNoun sn);
	int selectResultKinCount(SqlSessionTemplate session, SearchNoun sn);
	
	//블로그 크롤링 정보를 DB에 저장
	int insertBlogDummy (SqlSessionTemplate session, DummyData dd);
}
