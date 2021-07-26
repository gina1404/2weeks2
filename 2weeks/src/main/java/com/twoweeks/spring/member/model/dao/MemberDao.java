package com.twoweeks.spring.member.model.dao;

import org.apache.ibatis.session.SqlSession;

public interface MemberDao {
	
	public int idCheck(String userId, SqlSession session);

}
