package com.twoweeks.spring.member.model.service;

import java.util.Map;

import com.twoweeks.spring.member.model.vo.Member;

public interface MemberService {
	
	public int idCheck(String userId);
	
	public int insertMember(Member member);
	
	public int insertKakao(Member member);
	
	
	public Member selectMember(Map param);
	
	public String selectKakaoId(String sns_Id);
	
	
	

}
