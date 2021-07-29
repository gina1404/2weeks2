package com.twoweeks.spring.overseas.model.dao;

import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.twoweeks.spring.overseas.model.vo.OverseasGr;
@Repository
public class CoivdOverseasDaoImpl implements CoivdOverseasDao{

	@Override
	public int insertGrData(SqlSession session, int a) {
		// TODO Auto-generated method stub
		return session.insert("overseas.InsertOverseasGr", a);
	}

	@Override
	public OverseasGr selectydayDef(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("overseas.selectydayDef");
	}

	
	
	
}
