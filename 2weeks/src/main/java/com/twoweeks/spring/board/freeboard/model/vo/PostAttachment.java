package com.twoweeks.spring.board.freeboard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PostAttachment {
	
	private int atch_No; //첨부파일 번호
	private int post_Sq; //게시글 번호
	private String atch_Ori; //원본파일 이름
	private String atch_New; //리네임파일이름
	private Date upload_Date;
	private int downloadCount;

}
