package com.twoweeks.spring.covid.domestic.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.twoweeks.spring.covid.domestic.model.vo.Item;


public interface CovidDomesticDao {

	int kCovidDataInsert(SqlSession session, Map<String, Integer> param2);
	List<Item> getNumber(SqlSession session);
	int getToday(SqlSession session);
	int getTodayDecide(SqlSession session);

}
