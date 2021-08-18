package com.twoweeks.spring.member.model.vo;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

import lombok.Data;

@Data
public class Member {

	    // 회원 ID 
		
	    private String user_Id;
	    // 회원 이름 
	    private String user_Nm;
	    // 회원 비밀번호 
	    private String user_Pw;
	    private String user_Pw2;
	    // 회원 닉네임 
	    private String user_Nic;
	    // SNS 타입 KAKAO: 카카오톡 NAVER: 네이버
	    private String sns_Type;
	    // SNS 계정정보 
	    private String sns_Id;
	    // SNS 연동일 
	    private Date sns_Connected_Dt;
	    // 회원 생일 
	    private Date user_Bday;
	    // 회원 성별 
	    private String user_Gender;
	    // 회원 전화번호 
	    private int user_Phone;
	    // 회원 프로필사진 
	    private String user_Pf;
	    private String user_Pfrename;
	    // 글 작성 권한(확진/백신/의료) 관리자승인후 확진/백신/의료로 변경
	    private String access_Gb;
	    // 이메일 
	    private String user_Email;
	    //private String emailcheck;
	    // 현재 보유 포인트 
	    private int userPoint_Cnt;
	    // 자가격리시작일 
	    private Date quarantine_Dt;
	    // 주소 
	    private String user_Addr;
	    // 가입일 
	    private Date enroll_Dt;

}
