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
    public ModelAndView domesticTrend(ModelAndView mv) {
        ResponseEntity<String> responseEntity = vaccineService.getApi();
        Response response = vaccineService.parser(responseEntity.getBody());
        
        List<Item> items = response.getBody().getItems();
        System.out.println(responseEntity.getBody());
        System.out.println(responseEntity);
        mv.addObject("total",items.get(0).getTotalFirstCnt());  //전체 누적 통계(1차 접종)
        mv.addObject("first",items.get(0).getFirstCnt()); //당일 통계(1차 접종)
        mv.addObject("total2",items.get(0).getTotalSecondCnt()); //전체 누적 통계(2차 접종)
        mv.addObject("second",items.get(0).getSecondCnt()); //당일 통계(2차 접종)
        
        System.out.println(items.toString());
        mv.setViewName("domestic/map");
        
        return mv;
    }
}