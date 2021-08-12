package com.twoweeks.spring.admin.model.vo;

import lombok.Data;

@Data
public class Report {

	private String user_Id;
	private int post_Sq;
	private int kin_Sq;
	private int post_Reply_Sq;
	private int kin_Reply_Sq;
	private String report_Reason;
	private String report_Detail_Reason;
	private String report_Yn;
}
