package com.twoweeks.spring.covid.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.twoweeks.spring.covid.model.service.CovidUpdateRegionalKorService;
import com.twoweeks.spring.covid.model.vo.CovidRegionalKorData;


@Controller
public class CovidUpdateRegionalKorController {
	
	@Autowired
	private CovidUpdateRegionalKorService service;
	
	@RequestMapping("/covidUpdate/Regional/Kor.do")
	//코로나 지역별 현황(한국) 데이터를 받아다가 DB에 저장
	public void insertCovidRegionalKor() {
		//공공데이터포털에서 한국 데이터를 받아서 ListMap에 저장
		List<Map<String,String>> list=service.getCovidRegionalKorData();
		
		int result=0; //DB 저장 결과 확인용
		//List를 쪼개서 DB에 저장할 map을 나누어 보냄
		for(int i=0; i<list.size(); i++) {		
			result+=service.updateCovidRegionalKorData(list.get(i));
		}
		System.out.println(result>0?"지역별 현황 데이터 저장 : 성공":"지역별 현황 데이터 저장 : 실패");
	}
	
}
	
