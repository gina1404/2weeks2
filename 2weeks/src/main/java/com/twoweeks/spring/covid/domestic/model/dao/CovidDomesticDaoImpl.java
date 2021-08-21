package com.twoweeks.spring.covid.domestic.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class CovidDomesticDaoImpl implements CovidDomesticDao{

	@Override
	public int kCovidDataInsert(SqlSession session, Map<String, Integer> param2) {
		return session.insert("item.kCovidDataInsert",param2);
	}

	
	
	
}
