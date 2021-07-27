package com.twoweeks.spring.member.model.dao;

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
	
	

}
