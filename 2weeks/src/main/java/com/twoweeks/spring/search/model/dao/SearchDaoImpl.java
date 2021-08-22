package com.twoweeks.spring.search.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.know.model.vo.Kin;
import com.twoweeks.spring.search.model.vo.DummyData;
import com.twoweeks.spring.search.model.vo.SearchNoun;

@Repository
public class SearchDaoImpl implements SearchDao{

	//community 내부 검색
	@Override
	public List<FreeBoard> searchResultCommunity(SqlSessionTemplate session, SearchNoun sn) {
		return session.selectList("SearchMapper.searchResultCommunity",sn);
	}
	
	//community 상세 검색
	@Override
	public List<FreeBoard> selectResultCom(SqlSessionTemplate session, int cPage, int numPerpage, SearchNoun sn) {
		return session.selectList("SearchMapper.searchResultCom", sn, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	//community 전체 검색 수
	@Override
	public int selectResultComCount(SqlSessionTemplate session, SearchNoun sn) {
		return session.selectOne("SearchMapper.searchResultComCount", sn);
	}
	
	//지식인 내부 검색
	@Override
	public List<Kin> searchResultkNowledgeIn(SqlSessionTemplate session, SearchNoun sn) {
		return session.selectList("SearchMapper.searchResultKnowledgeIn",sn);
	}

	//지식인 상세 검색
	@Override
	public List<Kin> selectResultKin(SqlSessionTemplate session, int cPage, int numPerpage, SearchNoun sn) {
		return session.selectList("SearchMapper.searchResultKin", sn, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	//지식인 상세 검색 수
	@Override
	public int selectResultKinCount(SqlSessionTemplate session, SearchNoun sn) {
		return session.selectOne("SearchMapper.searchResultKinCount", sn);
	}

	//블로그 크롤링 정보를 DB에 저장
	@Override
	public int insertBlogDummy(SqlSessionTemplate session, DummyData dd) {
		return session.insert("SearchMapper.insertBlogDummy", dd);
	}
	
	

}
