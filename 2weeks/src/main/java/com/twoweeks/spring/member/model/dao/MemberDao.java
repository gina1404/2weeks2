package com.twoweeks.spring.member.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.twoweeks.spring.member.model.vo.Member;

public interface MemberDao {
	
	public int idCheck(String userId, SqlSession session);
	
	public int insertMember(Member member, SqlSession session);

}
