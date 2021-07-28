package com.twoweeks.spring.overseas.model.dao;

import java.util.Date;

import org.apache.ibatis.session.SqlSession;

public interface CoivdOverseasDao {
	int insertGrData(SqlSession session,int a);
}
