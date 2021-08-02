package com.twoweeks.spring.member.model.vo;

import javax.validation.constraints.NotEmpty;

import lombok.Data;

//로그인 검증

@Data
public class Login {
	
	@NotEmpty(message = "아이디를 입력해주세요")
	private String user_Id;
	@NotEmpty(message = "비밀번호를 입력해주세요")
	private String user_Pw;
	
	private boolean rememberId;

}
