package com.twoweeks.spring.admin.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class Notice {

	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private List<noticeAttachment> attachments=new ArrayList();
	
	
}
