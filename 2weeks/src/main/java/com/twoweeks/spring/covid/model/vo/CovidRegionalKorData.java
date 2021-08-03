package com.twoweeks.spring.covid.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class CovidRegionalKorData {
	private String stdDay;
	private String gubun;
	private String gubunEn;
	private String defCnt;
	private String incDec;
	private Date updtDay;
}
