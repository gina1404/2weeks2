package com.twoweeks.spring.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.twoweeks.spring.admin.model.vo.Notice;
import com.twoweeks.spring.admin.model.vo.noticeAttachment;
import com.twoweeks.spring.member.model.vo.Member;

public interface AdminDao {

	int insertNotice(Notice n,SqlSession session);
	int insertAttachment(SqlSession session,noticeAttachment a);
	List<Member> selectMemberList(SqlSession session);
}
