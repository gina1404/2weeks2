package com.twoweeks.spring.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class SignUp {
	 // 회원 ID 
    private String userId;

    // 회원 이름 
    private String userNm;

    // 회원 비밀번호 
    private String userPw;

    // 회원 닉네임 
    private String userNic;

    // SNS 타입 KAKAO: 카카오톡 NAVER: 네이버
    private String snsType;

    // SNS 계정정보 
    private String snsId;

    // SNS 연동일 
    private Date snsConnectedDt;

    // 회원 생일 
    //private Date userBday;

    // 회원 성별 
    private String userGender;

    // 회원 전화번호 
    private int userPhone;

    // 회원 프로필사진 
    private String userPf;

    // 이메일 
    private String userEmail;

    // 가입일 
    private Date enrollDt;

}
