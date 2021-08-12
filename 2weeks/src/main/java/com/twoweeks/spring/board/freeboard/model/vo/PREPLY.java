package com.twoweeks.spring.board.freeboard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PREPLY {
	private int no;
	private int post_Sq;
	private int grp;
	private int grps;
	private int grpl;
	private String writer;
	private String content;
	private Date wdate;
	
	// wdate과 현재시간의 차이를 계산후 받아오기 위함
		private String wgap;
	
		// writer의 프로필사진을 가져온다.
		private String profile;
}

