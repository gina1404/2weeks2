package com.twoweeks.spring.covid.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.twoweeks.spring.covid.model.vo.CovidRegionalKorData;

@Repository
public class CovidUpdateRegionalKorDaoImpl implements CovidUpdateRegionalKorDao{

	//Map을 보내서 DB에 저장	
	@Override
	public int updateCovidRegionalKorData(SqlSessionTemplate session, Map<String, String> map) {
		return session.update("CovidRegionalKorData.updateCovidRegionalKorData", map);
	}

	
}
