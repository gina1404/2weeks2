package com.twoweeks.spring.overseas.controller;





import java.text.DecimalFormat;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.twoweeks.spring.overseas.model.sevice.CovidOverseasService;
import com.twoweeks.spring.overseas.model.vo.Item;
import com.twoweeks.spring.overseas.model.vo.OverseasGr;
import com.twoweeks.spring.overseas.model.vo.Response;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CovidOverseasController {
	
	@Autowired
	private CovidOverseasService service;
	
	@RequestMapping("/covid/overseas.do")
	public ModelAndView OverseasList(ModelAndView mv,OverseasGr gr) {
			
			ResponseEntity<String> responseEntity = service.getApi();
			Response response = service.parser(responseEntity.getBody());
			
			List<Item> list = response.getBody().getItems();
			
			int a=0;
			for(int i=0;i<list.size();i++) {
				a+=list.get(i).getNatDefCnt();
			}
			
			int b=0;
			for(int i=0;i<list.size();i++) {
				b+=list.get(i).getNatDeathCnt();
			}
			
			
			OverseasGr gg=new OverseasGr();
			gg.setTotal(a);
			gg.setDeath(b);
			try {
				int result=service.insertGrData(gg);				
			}catch (Exception e) {
				System.out.println("이미등록");
				e.printStackTrace();
			}
		
			
			
			DecimalFormat formatter=new DecimalFormat("###,###");
			String totalDef=formatter.format(a);
			String totalDet=formatter.format(b);
			
			
			OverseasGr ydayDef=service.selectydayDef();
			System.out.println(ydayDef);
			int todayDef=a-ydayDef.getTotal();
			int todayDeath=b-ydayDef.getDeath();
			//System.out.println(todayDef);
			String realtodayDef=formatter.format(todayDef);
			
			OverseasGr gg2=new OverseasGr();
			gg2.setToday_Def(todayDef);
			gg2.setToday_Death(todayDeath);
			System.out.println(gg2);
			try {
				int result2=service.updateGrData(gg2);
			}catch (Exception e) {
				System.out.println("오늘의 확진자 등록실패");
				e.printStackTrace();
			}
			
			/*
			 * OverseasGr gr1=service.selectToday(); OverseasGr
			 * gr3=service.selectAgoThree(); OverseasGr gr4=service.selectAgoFour();
			 * OverseasGr gr5=service.selectAgoFive(); OverseasGr
			 * gr6=service.selectAgoSix(); OverseasGr gr7=service.selectAgoSeven();
			 */
			
			List<OverseasGr>Grlist=service.selectGrList();
			
			
			mv.addObject("Grlist", Grlist);
			mv.addObject("realtodayDef", realtodayDef);
			mv.addObject("totalDef", totalDef);
			mv.addObject("totalDet", totalDet);
			mv.setViewName("covidUpdate/overseas");

		return mv;
	}

}
