package com.twoweeks.spring.overseas.model.dao;

import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
@Repository
public class CoivdOverseasDaoImpl implements CoivdOverseasDao{

	@Override
	public int insertGrData(SqlSession session, int a) {
		// TODO Auto-generated method stub
		return session.insert("overseas.InsertOverseasGr", a);
	}

	
	
}
