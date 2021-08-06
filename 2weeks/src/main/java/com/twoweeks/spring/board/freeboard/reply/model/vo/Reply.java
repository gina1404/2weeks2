package com.twoweeks.spring.board.freeboard.reply.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reply {

	
	
	   // 댓글 번호 
    private int reply_Sq;

    // 댓글 작성자 ID 
    private String user_Id;

    // 게시글 번호 참조 
    private int post_Sq;

    // 댓글 본문 
    private String reply_Content;

    // 댓글 이미지 
    private String reply_Image;

    // 작성자명 공개여부 Y/N
    private String oepn_Yn;

    // 비밀 댓글 Y(공개댓글) / N(비공개댓글)
    private String secret_Yn;

    // 작성일 
    private Date reply_Dt;

    // 좋아요 
    private int reply_Like_Cnt;

    // level 원댓글 : 1 / 대댓글 : 2
    private int reply_Level;

    // 댓글 참조 
    private int reply_Ref;

    // 댓글 수정일자 
    private Date updateDate;
}
