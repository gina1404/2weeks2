package com.twoweeks.spring.covid.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.twoweeks.spring.covid.model.vo.CovidRegionalKorData;

public interface CovidUpdateRegionalKorDao {
	
	//ListMap을 보내서 DB에 저장	
	int updateCovidRegionalKorData(SqlSessionTemplate session, Map<String, String> map);

	//DB에 저장된 데이터를 조회해옴
	List<CovidRegionalKorData> selectCovidRegionalKorList(SqlSessionTemplate session);
}
