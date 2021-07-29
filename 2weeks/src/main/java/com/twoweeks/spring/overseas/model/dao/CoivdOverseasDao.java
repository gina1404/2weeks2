package com.twoweeks.spring.overseas.model.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.twoweeks.spring.overseas.model.vo.OverseasGr;

public interface CoivdOverseasDao {
	int insertGrData(SqlSession session,OverseasGr gg);
	OverseasGr selectydayDef(SqlSession session);
	List<OverseasGr>selectGrList(SqlSession session);
	int updateGrData(SqlSession session,OverseasGr gg2);
}
