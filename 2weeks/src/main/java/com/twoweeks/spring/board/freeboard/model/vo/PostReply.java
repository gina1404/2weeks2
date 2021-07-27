package com.twoweeks.spring.board.freeboard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostReply {
	
	private int reply_Sq; //댓글번호
	private String user_Id; //댓글 작성자Id
	private int post_Ref; //게시글번호 참조
	private String reply_Content; //댓글본문
	private String reply_Image; //댓글 이미지
	private String open_Yn; //작성자명 공개여부
	private String secret_Yn; //비밀 댓글
	private Date reply_Dt; //작성일
	private String reply_Like_Cnt; //좋아요
	private String reply_Level; //level
	private String reply_Ref; //댓글 참조
}
