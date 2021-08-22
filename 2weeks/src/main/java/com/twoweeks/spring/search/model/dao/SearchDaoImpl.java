package com.twoweeks.spring.search.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.search.model.vo.DummyData;
import com.twoweeks.spring.search.model.vo.SearchNoun;

@Repository
public class SearchDaoImpl implements SearchDao{

	//community 내부 검색 결과
	@Override
	public List<FreeBoard> searchResultCommunity(SqlSessionTemplate session, SearchNoun sn) {
		return session.selectList("SearchMapper.searchResultCommunity",sn);
	}
	
	
	//community 전체 검색
	@Override
	public List<FreeBoard> selectResultCom(SqlSessionTemplate session, int cPage, int numPerpage, SearchNoun sn) {
		return session.selectList("SearchMapper.searchResultCom", sn, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}
	
	@Override
	public int selectResultComCount(SqlSessionTemplate session, SearchNoun sn) {
		// TODO Auto-generated method stub
		return session.selectOne("SearchMapper.searchResultComCount", sn);
	}


	//블로그 크롤링 정보를 DB에 저장
	@Override
	public int insertBlogDummy(SqlSessionTemplate session, DummyData dd) {
		return session.insert("SearchMapper.insertBlogDummy", dd);
	}
	
	

}
