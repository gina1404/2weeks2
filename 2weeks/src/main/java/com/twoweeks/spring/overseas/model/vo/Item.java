package com.twoweeks.spring.overseas.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Item {

	private int totalCount;
	private int SEQ;
	private Date stdDay;
	private String areaNm;
	private String areaNmEn;
	private String areaNmCn;
	private String nationNm;
	private String nationNmEn;
	private String nationNmCn;
	private int natDefCnt;
	private int natDeathCnt;
	private Double natDeathRate;
	private Date createDt;
	private Date updateDt;
	
}
