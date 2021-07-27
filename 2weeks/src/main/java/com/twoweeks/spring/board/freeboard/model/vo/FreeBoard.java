package com.twoweeks.spring.board.freeboard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FreeBoard {
	
	private int post_Sq; //게시글 번호
	private String user_Id; //작성자Id
	private String menu_Gb; //게시판 종류
	private String category_Gb; //카테고리(글 분류)
	private String post_Title; //게시글 제목
	private String post_Content; //게시글 본문
	private String share_Yn; //공유 설정
	private String post_Like_Cnt; //좋아요
	private Date post_Dt; //작성일
	private String post_Cnt; //조회수
	private String open_Yn; //작성자명 공개 여부
}
