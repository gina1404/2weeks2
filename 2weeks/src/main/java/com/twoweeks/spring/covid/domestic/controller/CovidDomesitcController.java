package com.twoweeks.spring.covid.domestic.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.covid.domestic.model.Service.CovidDomesticService;
import com.twoweeks.spring.covid.domestic.model.vo.Item;
import com.twoweeks.spring.covid.domestic.model.vo.Response;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class CovidDomesitcController {

	
	@Autowired
	private CovidDomesticService service;
	
	@GetMapping("/covidUpdate/domestic.do")
	public ModelAndView domesticTrend(ModelAndView mv) {
		mv.setViewName("domestic/domesticList");
		return mv;
	}
	
	
	@RequestMapping("domestic/cases")
	public ModelAndView cases(ModelAndView mv) {
		
		ResponseEntity<String> responseEntity = service.getApi();
		Response response = service.parser(responseEntity.getBody());
		List<Item> items = response.getBody().getItems();

	
		String json =  service.getGoodBye();
		System.out.println(items.toString());
	
	mv.addObject("decide",items.get(0).getDecideCnt()); 
	mv.addObject("death",items.get(0).getDeathCnt());
	mv.addObject("accExamCnt",items.get(0).getAccExamCnt());
	mv.addObject("clearCnt",items.get(0).getClearCnt());
	//뒤에 소수점 .xxx가 붙어서 맨뒤에서 부터 4글자를 삭제해줌
	String cd = items.get(0).getCreateDt();
	cd = cd.substring(0, cd.length()-3);
	

	log.info(cd);
	mv.addObject("day",cd); //기준일
	
	
	mv.setViewName("covidUpdate/domestic");
	return mv;
	}
	
	@Scheduled(cron = "0 0 12 * * *")
	public void kCovidDataSave() {
		
		ResponseEntity<String> responseEntity = service.kCovidDataSave();
		Response response = service.parser(responseEntity.getBody());
		List<Item> items = response.getBody().getItems();
		Map<String, Integer> param2 = new HashMap<String, Integer>();
		log.info("dsadsadwsa : "+items.get(0).getStateDt());
		
		for(int i =0; i<items.size(); i++) {
			
		param2.put("accExamCnt", items.get(i).getAccExamCnt());
		param2.put("clearCnt", items.get(i).getClearCnt());
		param2.put("stateDt", items.get(i).getStateDt());
		param2.put("deathCnt", items.get(i).getDeathCnt());
		param2.put("decideCnt", items.get(i).getDecideCnt());
		
		service.kCovidDataInsert(param2);
		}
		
	}
}
