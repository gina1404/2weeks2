package com.twoweeks.spring.member.model.vo;

import javax.validation.constraints.Pattern;

import lombok.Data;

@Data
public class UpdateMember {
	
	private String user_Id;
	 // 회원 닉네임 
    private String user_Nic;
    // 회원 프로필사진 
    private String user_Pf;
    
    private String user_Pfrename;
    
    private String user_Email;
    
    // 회원 전화번호 
    private int user_Phone;
    
    private String oldPw;
    
    // 회원 비밀번호 
    @Pattern(regexp = "^(?=.*[0-9a-zA-Z])(?=.*[!@#$%^&*]).{6,}$")
    private String user_Pw;
    
    private String user_Pw2;
    
}
