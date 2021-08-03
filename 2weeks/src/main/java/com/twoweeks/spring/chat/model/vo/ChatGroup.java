package com.twoweeks.spring.chat.model.vo;

import lombok.Data;

@Data
public class ChatGroup {

	private int groupNo;
	private String maker;
	private String title;
	private int cnt;
	private String content;
	
}
