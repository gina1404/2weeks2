package com.twoweeks.spring.covid.report.model.vo;

import java.util.Date;

import org.jsoup.select.Elements;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NewsReport {
	
	private int no;
	private String title;
	private String team;
	private String attachment;
	private String date;
	private String url;

}
