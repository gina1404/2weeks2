package com.twoweeks.spring.covid.domestic.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;


public interface CovidDomesticDao {

	int kCovidDataInsert(SqlSession session, Map<String, Integer> param2);

}
