package com.twoweeks.spring.overseas.model.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.twoweeks.spring.overseas.model.vo.OverseasGr;
@Repository
public class CoivdOverseasDaoImpl implements CoivdOverseasDao{

	@Override
	public int insertGrData(SqlSession session, OverseasGr gg) {
		// TODO Auto-generated method stub
		return session.insert("overseas.InsertOverseasGr", gg);
	}

	@Override
	public OverseasGr selectydayDef(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("overseas.selectydayDef");
	}

	@Override
	public List<OverseasGr> selectGrList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("overseas.selectGrList");
	}

	@Override
	public int updateGrData(SqlSession session, OverseasGr gg2) {
		// TODO Auto-generated method stub
		return session.update("overseas.updateGrData", gg2);
	}
	

	
	
	
}
