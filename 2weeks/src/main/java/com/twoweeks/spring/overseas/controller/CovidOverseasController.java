package com.twoweeks.spring.overseas.controller;

import java.beans.Encoder;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.overseas.model.sevice.CovidOverseasService;
import com.twoweeks.spring.overseas.model.vo.Item;
import com.twoweeks.spring.overseas.model.vo.OverseasGr;
import com.twoweeks.spring.overseas.model.vo.OverseasPie;
import com.twoweeks.spring.overseas.model.vo.Response;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CovidOverseasController {

	@Autowired
	private CovidOverseasService service;

	@RequestMapping(value = "/covid/overseas.do", produces = "application/xml;charset=utf-8")
	public ModelAndView OverseasList(ModelAndView mv, OverseasGr gr) {

		/* api 가져오기 */
		ResponseEntity<String> responseEntity = service.getApi();
		Response response = service.parser(responseEntity.getBody());

		List<Item> list = response.getBody().getItems();
		
		/* list 확진자 순으로 내림차순 정렬 */
		Collections.sort(list,new Comparator<Item>() {
			@Override
			public int compare(Item o1,Item o2) {
				return Integer.compare(o1.getNatDefCnt(), o2.getNatDefCnt());
			}
		}.reversed());

		/*
		 * api정보 db에 저장 try { service.insertOverseasList(list);
		 * 
		 * }catch (Exception e) { // TODO: handle exception e.printStackTrace(); }
		 */

		/* 확진자 총합, 사망자 총합 */
		int a = 0;
		for (int i = 0; i < list.size(); i++) {
			a += list.get(i).getNatDefCnt();
		}

		int b = 0;
		for (int i = 0; i < list.size(); i++) {
			b += list.get(i).getNatDeathCnt();
		}

		/* 확진자/사망자 총합 db에 저장 */
		OverseasGr gg = new OverseasGr();
		gg.setTotal(a);
		gg.setDeath(b);
		try {
			int result = service.insertGrData(gg);
		} catch (Exception e) {
			System.out.println("이미등록");
		}

		/* 확진자/사망자 총합 숫자형식으로 포맷 */
		DecimalFormat formatter = new DecimalFormat("###,###");
		String totalDef = formatter.format(a);
		String totalDet = formatter.format(b);

		/* 어제자 확진자/사망자 총합 가져오기 */
		OverseasGr ydayDef = service.selectydayDef();
		System.out.println(ydayDef);
		int todayDef = Math.abs(a - ydayDef.getTotal());

		int todayDeath = Math.abs(b - ydayDef.getDeath());

		// System.out.println(todayDef);
		String realtodayDef = formatter.format(todayDef);

		/* 일별 확진자/사망자 db에 저장 */
		OverseasGr gg2 = new OverseasGr();
		gg2.setToday_Def(todayDef);
		gg2.setToday_Death(todayDeath);
		System.out.println(gg2);
		try {
			int result2 = service.updateGrData(gg2);
		} catch (Exception e) {
			System.out.println("오늘의 확진자 등록실패");
		}

		/*
		 * OverseasGr gr1=service.selectToday(); OverseasGr
		 * gr3=service.selectAgoThree(); OverseasGr gr4=service.selectAgoFour();
		 * OverseasGr gr5=service.selectAgoFive(); OverseasGr
		 * gr6=service.selectAgoSix(); OverseasGr gr7=service.selectAgoSeven();
		 */

		/* 막대그래프 데이터 가져오기 */
		List<OverseasGr> Grlist = service.selectGrList();

		List<OverseasPie> pielist = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getNationNmEn().equals("United States of America")) {
				OverseasPie op1 = new OverseasPie();
				op1.setNationNm("미국");
				op1.setDefCount(list.get(i).getNatDefCnt());
				pielist.add(op1);
			} else if (list.get(i).getNationNmEn().equals("Japan")) {
				OverseasPie op1 = new OverseasPie();
				op1.setNationNm("일본");
				op1.setDefCount(list.get(i).getNatDefCnt());
				pielist.add(op1);
			} else if (list.get(i).getNationNmEn().equals("United Kingdom")) {
				OverseasPie op1 = new OverseasPie();
				op1.setNationNm("영국");
				op1.setDefCount(list.get(i).getNatDefCnt());
				pielist.add(op1);
			} else if (list.get(i).getNationNmEn().equals("France")) {
				OverseasPie op1 = new OverseasPie();
				op1.setNationNm("프랑스");
				op1.setDefCount(list.get(i).getNatDefCnt());
				pielist.add(op1);
			} else if (list.get(i).getNationNmEn().equals("Germany")) {
				OverseasPie op1 = new OverseasPie();
				op1.setNationNm("독일");
				op1.setDefCount(list.get(i).getNatDefCnt());
				pielist.add(op1);
			} else if (list.get(i).getNationNmEn().equals("Italy")) {
				OverseasPie op1 = new OverseasPie();
				op1.setNationNm("이탈리아");
				op1.setDefCount(list.get(i).getNatDefCnt());
				pielist.add(op1);
			} else if (list.get(i).getNationNmEn().equals("Canada")) {
				OverseasPie op1 = new OverseasPie();
				op1.setNationNm("캐나다");
				op1.setDefCount(list.get(i).getNatDefCnt());
				pielist.add(op1);
			}
		}
		/*
		 * System.out.println(pielist);
		 * 
		 * System.out.println(list.get(5).getNationNm());
		 */
		System.out.println(list.get(0).getNationNmEn());
		System.out.println(list.get(0).getNatDeathCnt());

		mv.addObject("list", list);
		mv.addObject("pielist", pielist);
		mv.addObject("Grlist", Grlist);
		mv.addObject("realtodayDef", realtodayDef);
		mv.addObject("totalDef", totalDef);
		mv.addObject("totalDet", totalDet);
		mv.setViewName("covidUpdate/overseas");

		return mv;
	}

}
