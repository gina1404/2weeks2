package com.twoweeks.spring.member.model.service;

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
	public int idCheck(String userId) {
		return memberDao.idCheck(userId,session);
	}

	@Override
	public int insertMember(Member member) {		
		return memberDao.insertMember(member,session);
	}
	
	

}
