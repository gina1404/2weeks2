package com.twoweeks.spring.search.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class SearchExternalNaver {
	private Date postdate;
	private String title;
	private String link;
	private String description;
	private String bloggername;
	private String bloggerlink;
	
}
