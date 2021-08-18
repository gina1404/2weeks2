package com.twoweeks.spring.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.twoweeks.spring.admin.model.vo.Grant;
import com.twoweeks.spring.admin.model.vo.Notice;
import com.twoweeks.spring.admin.model.vo.Point;
import com.twoweeks.spring.admin.model.vo.Report;
import com.twoweeks.spring.admin.model.vo.noticeAttachment;
import com.twoweeks.spring.member.model.vo.Member;

public interface AdminDao {

	int insertNotice(Notice n,SqlSession session);
	int insertAttachment(SqlSession session,noticeAttachment a);
	List<Member> selectMemberList(SqlSession session);
	int selectMembercount(SqlSession session);
	int deleteMember(SqlSession session,String userId);
	int insertPointEnd(SqlSession session,Point re);
	int selectMemberPoint(SqlSession session,String name);
	int updatePointEnd(SqlSession session,Point re);
	List<Report>adminReporttable(SqlSession session);
	int selectReportCount(SqlSession session);
	int reportUpdateYn(SqlSession session,String pk);
	List<Report>reportList(SqlSession session,String userId);
	List<Grant>selectGrantTable(SqlSession session);
	int updateGrantTable(SqlSession session,String userId);
	int updateGrantMember(SqlSession session,Member m);
	int selectGrantCount(SqlSession session);
}
