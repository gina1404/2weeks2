package com.twoweeks.spring.overseas.model.dao;



import org.apache.ibatis.session.SqlSession;

import com.twoweeks.spring.overseas.model.vo.OverseasGr;

public interface CoivdOverseasDao {
	int insertGrData(SqlSession session,int a);
	OverseasGr selectydayDef(SqlSession session);
}
