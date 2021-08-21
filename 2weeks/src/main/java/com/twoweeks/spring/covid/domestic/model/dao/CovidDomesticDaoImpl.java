package com.twoweeks.spring.covid.domestic.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.twoweeks.spring.covid.domestic.model.vo.Item;


@Repository
public class CovidDomesticDaoImpl implements CovidDomesticDao{

	@Override
	public int kCovidDataInsert(SqlSession session, Map<String, Integer> param2) {
		return session.insert("item.kCovidDataInsert",param2);
	}

	@Override
	public List<Item> getNumber(SqlSession session) {
		return session.selectList("item.getNumber");
	}

	@Override
	public List<Integer> getToday(SqlSession session) {
		return session.selectList("item.getToday");
	}



	
	
	
}
