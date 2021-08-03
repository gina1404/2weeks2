package com.twoweeks.spring.member.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.twoweeks.spring.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public int idCheck(String userId, SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("member.idCheck",userId);
	}

	@Override
	public int insertMember(Member member, SqlSession session) {
		return session.insert("member.insertMember",member);
	}
	

	@Override
	public int insertKakao(Member member, SqlSession session) {
		return session.insert("member.insertKakao",member);
	}

	@Override
	public Member selectMember(Map param, SqlSession session) {
		
		return session.selectOne("member.selectMember",param);
	}

	@Override
	public String selectKakaoId(String sns_Id, SqlSession session) {
		return session.selectOne("member.selectKakaoId",sns_Id);
	}

	@Override
	public String findId(Member member, SqlSession session) {
		return session.selectOne("member.findId",member);
	}

	@Override
	public int updatePw(Member member, SqlSession session) {
		return session.update("member.updatePw",member);
	}

	@Override
	public int UpdateMember(Member member, SqlSession session) {
		return session.update("member.updateMember",member);
	}

	@Override
	public String selectPw(String user_Id, SqlSession session) {
		return session.selectOne("member.selectPw",user_Id);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
