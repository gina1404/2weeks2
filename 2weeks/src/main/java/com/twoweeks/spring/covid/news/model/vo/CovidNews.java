package com.twoweeks.spring.covid.news.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CovidNews {
	
	
		private int no;  //뉴스번호
		private String title; //뉴스 제목
		private String company; //ytn
		private	String journalist; //기자이름
		private String content; //내용
		private String url; // 하이퍼링크 주소
		private String	picture; //뉴스 사진\
		private String newsDate; //날짜
}
