package com.twoweeks.spring.know.model.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Kin {
	private int kin_Sq;   //게시글 번호
	private String kin_Writer; //게시글 작성자
	private String category;   //카테고리
	private String kin_Title;  //게시글 제목
	private String kin_Content; //게시글 내용
	private String kin_Image; //첨부파일 
	private String open_Yn; //아이디 공개여부 
	private int selected;  //채택여부
	private Date kin_Date;  // 게시글 작성일
	private int kin_Cnt;   //조회수 
	private int reply_Cnt; //답글 수 
	private int point; //포인트 
	private List<KinAttachment> attachments=new ArrayList();
}
