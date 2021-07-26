package com.twoweeks.spring.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public int idCheck(String userId, SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("member.idCheck",userId);
	}
	

}
