package com.twoweeks.spring.covid.vaccine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.covid.vaccine.Service.VaccineService;
import com.twoweeks.spring.covid.vaccine.model.vo.Body;
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
        String datetime = response.getBody().getDataTime();
    	mv.addObject("items",items);
    	mv.addObject("datetime",datetime);
        System.out.println(items);
        System.out.println(datetime);
        mv.setViewName("covidUpdate/domesticVaccine");
        
        return mv;
    }
}