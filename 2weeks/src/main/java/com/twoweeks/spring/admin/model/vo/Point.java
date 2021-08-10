package com.twoweeks.spring.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class Point {

	private String userId;
	private int pointAmt;
	private String pointGb;
	private String pointDiscription;
}
