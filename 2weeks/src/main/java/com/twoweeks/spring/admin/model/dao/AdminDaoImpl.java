package com.twoweeks.spring.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.twoweeks.spring.admin.model.vo.Grant;
import com.twoweeks.spring.admin.model.vo.Notice;
import com.twoweeks.spring.admin.model.vo.Point;
import com.twoweeks.spring.admin.model.vo.Report;
import com.twoweeks.spring.admin.model.vo.noticeAttachment;
import com.twoweeks.spring.member.model.vo.Member;

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

	@Override
	public List<Member> selectMemberList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("notice.selectMemberList");
	}

	@Override
	public int selectMembercount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("notice.selectMembercount");
	}

	@Override
	public int deleteMember(SqlSession session, String userId) {
		// TODO Auto-generated method stub
		return session.delete("notice.deleteMember", userId);
	}

	@Override
	public int insertPointEnd(SqlSession session, Point re) {
		// TODO Auto-generated method stub
		return session.insert("notice.insertPointEnd", re);
	}

	@Override
	public int selectMemberPoint(SqlSession session, String name) {
		// TODO Auto-generated method stub
		return session.selectOne("notice.selectMemberPoint", name);
	}
	
	@Override
	public int updatePointEnd(SqlSession session, Point re) {
		// TODO Auto-generated method stub
		return session.update("notice.updatePointEnd", re);
	}

	@Override
	public List<Report> adminReporttable(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("notice.adminReporttable");
	}

	@Override
	public int selectReportCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("notice.selectReportCount");
	}

	@Override
	public int reportUpdateYn(SqlSession session, String pk) {
		// TODO Auto-generated method stub
		return session.update("notice.reportUpdateYn", pk);
	}

	@Override
	public List<Report> reportList(SqlSession session, String userId) {
		// TODO Auto-generated method stub
		return session.selectList("notice.reportList", userId);
	}

	@Override
	public List<Grant> selectGrantTable(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("notice.selectGrantTable");
		
	}

	@Override
	public int updateGrantTable(SqlSession session, String userId) {
		// TODO Auto-generated method stub
		return session.update("notice.updateGrantTable", userId);
	}

	@Override
	public int updateGrantMember(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.delete("notice.updateGrantMember", m);
	}

	@Override
	public int selectGrantCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("notice.selectGrantCount");
	}

	@Override
	public int deletePost(SqlSession session, int seq) {
		// TODO Auto-generated method stub
		return session.delete("notice.deletePost", seq);
	}

	@Override
	public int deleteKin(SqlSession session, int seq) {
		// TODO Auto-generated method stub
		return session.delete("notice.deleteKin",seq);
	}

	@Override
	public int deletePostReply(SqlSession session, int seq) {
		// TODO Auto-generated method stub
		return session.delete("notice.deletePostReply", seq);
	}

	@Override
	public int deleteKinReply(SqlSession session, int seq) {
		// TODO Auto-generated method stub
		return session.delete("notice.deleteKinReply", seq);
	}

	@Override
	public int deleteGrant(SqlSession session, String userId) {
		// TODO Auto-generated method stub
		return session.delete("notice.deleteGrant", userId);
	}
	
	
	

}
