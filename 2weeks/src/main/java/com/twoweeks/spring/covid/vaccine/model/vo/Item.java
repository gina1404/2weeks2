package com.twoweeks.spring.covid.vaccine.model.vo;

import lombok.Data;

@Data
public class Item {
	              
	/*
	 * private int vaccine_no; //구분번호
	 */	
	private String baseDate; //	통계 기준일자
	private String sido; //	지역명칭
	private int firstCnt; //당일 통계(1차 접종)
	private int secondCnt; //당일 통계(2차 접종)
	private int totalFirstCnt; //전체 누적 통계(1차 접종)
	private int totalSecondCnt; //전체 누적 통계(2차 접종)
	private int accumulatedFirstCnt; //전일까지의 누적 통계 (1차 접종)
	private int accumulatedSecondCnt;//	전일까지의 누적 통계 (2차 접종)
	
	
	
}
