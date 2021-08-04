package com.twoweeks.spring.admin.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.twoweeks.spring.admin.model.vo.Notice;
import com.twoweeks.spring.admin.model.vo.noticeAttachment;

public interface AdminDao {

	int insertNotice(Notice n,SqlSession session);
	int insertAttachment(SqlSession session,noticeAttachment a);
}
