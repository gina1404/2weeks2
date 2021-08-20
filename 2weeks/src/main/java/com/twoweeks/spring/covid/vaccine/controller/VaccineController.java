package com.twoweeks.spring.covid.vaccine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.covid.vaccine.Service.VaccineService;
import com.twoweeks.spring.covid.vaccine.model.vo.Item;
import com.twoweeks.spring.covid.vaccine.model.vo.Response;

@RestController
public class VaccineController {
    @Autowired
    private VaccineService vaccineService;
    
    @GetMapping("/covidUpdate/domesticVaccine.do")
    public ModelAndView domesticVaccine(ModelAndView mv) {
        ResponseEntity<String> responseEntity = vaccineService.getApi();
        Response response = vaccineService.parser(responseEntity.getBody());
        
        List<Item> items = response.getBody().getItems();

        System.out.println(items);
		/*
		 * mv.addObject("baseDate",items.get(0).getBaseDate()); //날짜
		 * mv.addObject("sido",items.get(0).getSido()); // 지역
		 * mv.addObject("firstCnt",items.get(0).getFirstCnt()); //당일 통계(1차 접종)
		 * mv.addObject("totalfirstCnt",items.get(0).getTotalFirstCnt()); //전체 누적 통계(1차
		 * 접종) mv.addObject("secondCnt",items.get(0).getSecondCnt()); //당일 통계(2차 접종)
		 * mv.addObject("totalSecondCnt",items.get(0).getTotalSecondCnt()); //전체 누적
		 * 통계(2차 접종)
		 * mv.addObject("accumulatedFirstCnt",items.get(0).getAccumulatedFirstCnt());
		 * //전일 누적 통계(1차 접종)
		 * mv.addObject("accumulatedSecondCnt",items.get(0).getAccumulatedSecondCnt());
		 * //전일 누적 통계(2차 접종)
		 */        
        mv.setViewName("covidUpdate/domesticVaccine");
        
        return mv;
    }
}