package com.twoweeks.spring.overseas.controller;





import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
		
			int result=service.insertGrData(a);
			
			DecimalFormat formatter=new DecimalFormat("###,###");
			String totalDef=formatter.format(a);
			String totalDet=formatter.format(b);
			
			mv.addObject("totalDef", totalDef);
			mv.addObject("totalDet", totalDet);
			mv.setViewName("covidUpdate/overseas");

		return mv;
	}

}
