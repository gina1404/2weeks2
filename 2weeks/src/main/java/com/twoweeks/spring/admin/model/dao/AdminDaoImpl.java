package com.twoweeks.spring.admin.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.twoweeks.spring.admin.model.vo.Notice;
import com.twoweeks.spring.admin.model.vo.noticeAttachment;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Override
	public int insertNotice(Notice n, SqlSession session) {
		// TODO Auto-generated method stub
		return session.insert("notice.insertNotice",n);
	}

	@Override
	public int insertAttachment(SqlSession session, noticeAttachment a) {
		// TODO Auto-generated method stub
		return session.insert("notice.insertAttachment",a);
	}
	
	

}
