package com.twoweeks.spring.member.model.vo;

import java.sql.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

import lombok.Data;

@Data
public class SignUp {
	 // 회원 ID 
	@NotEmpty
	@Length(min=6, max=10)
	private String user_Id;
	
	@NotEmpty
    // 회원 이름 
	private String user_Nm;

    // 회원 비밀번호 
	@Length(min=6)	
	private String user_Pw;

    // 회원 닉네임 
	 private String user_Nic;

    // SNS 타입 KAKAO: 카카오톡 NAVER: 네이버
	 private String sns_Type;

    // SNS 계정정보 
	 private String sns_Id;

    // SNS 연동일 
	 private Date sns_Connected_Dt;

    // 회원 생일 
    //private Date user_Bday;

    // 회원 성별 
	 private String user_Gender;

    // 회원 전화번호 
	 private int user_Phone;

    // 회원 프로필사진 
	 private String user_Pf;

    // 이메일 
	 private String user_Email;
	 
	// 주소 
	//private String user_Addr;

    // 가입일 
	 private Date enroll_Dt;

}
