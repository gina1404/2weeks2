package com.twoweeks.spring.covid.model.service;

import java.util.List;
import java.util.Map;

import com.twoweeks.spring.covid.model.vo.CovidRegionalKorData;

public interface CovidUpdateRegionalKorService {
	
	//공공데이터포털에서 한국 데이터를 받아서 ListMap에 저장
	List<Map<String,String>> getCovidRegionalKorData();
	
	//map을 보내서 DB에 저장	
	int updateCovidRegionalKorData(Map<String, String> map);
	
	//DB에 저장된 데이터 조회
	List<CovidRegionalKorData> selectCovidRegionalKorList();
}
