package com.twoweeks.spring.member.model.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twoweeks.spring.member.model.dao.MemberDao;
import com.twoweeks.spring.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSession session;

	@Override
	//아이디 중복체크
	public int idCheck(String userId) {
		return memberDao.idCheck(userId,session);
	}

	@Override
	//회원가입
	public int insertMember(Member member) {		
		return memberDao.insertMember(member,session);
	}
	//카카오 가입
	public int insertKakao(Member member) {		
		return memberDao.insertKakao(member,session);
	}

	@Override
	//로그인
	public Member selectMember(Map param) {
		return memberDao.selectMember(param,session);
	}

	@Override
	public String selectKakaoId(String sns_Id) {
		return memberDao.selectKakaoId(sns_Id,session);
	}
	
	//아이디찾기
	@Override
	public String findId(Member member) {
		return memberDao.findId(member,session);
	}

	//임시비밀번호로 변경 
	public int updatePw(Member member) {	
		return memberDao.updatePw(member,session);
	}

	@Override
	public int UpdateMember(Member member) {
		return memberDao.UpdateMember(member, session);
	}

	@Override
	public String selectPw(String user_Id) {
		return memberDao.selectPw(user_Id,session);
	}

	@Override
	public int nicCheck(String userNic) {
		
		return memberDao.nicCheck(userNic,session);
	}
	
	
	
	
	
	
	
	
	
	
	


	
	
	
	

}
