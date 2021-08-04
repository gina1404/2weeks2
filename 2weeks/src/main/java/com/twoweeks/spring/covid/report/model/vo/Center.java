package com.twoweeks.spring.covid.report.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Center {

	private int centerNo;
	private String centerName;
	private String sido;
	private String sigungu;
	private String address;
	private String phone;	
	
}
