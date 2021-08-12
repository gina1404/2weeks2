package com.twoweeks.spring.admin.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twoweeks.spring.admin.model.dao.AdminDao;
import com.twoweeks.spring.admin.model.vo.Notice;
import com.twoweeks.spring.admin.model.vo.Point;
import com.twoweeks.spring.admin.model.vo.Report;
import com.twoweeks.spring.admin.model.vo.noticeAttachment;
import com.twoweeks.spring.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao dao;
	@Autowired
	private SqlSession session;
	@Override
	public int insertNotice(Notice n) {
		// TODO Auto-generated method stub
		int result=dao.insertNotice(n,session);
		int NoticeNo=n.getNoticeNo();
		if(result>0) {
			List<noticeAttachment> attachments=n.getAttachments();
			if(attachments.size()>0) {
				for(noticeAttachment a:attachments) {
					a.setNoticeNo(NoticeNo);
					result=dao.insertAttachment(session,a);
				}
			}else if(result>0) return 1;
			else return 0;
		}else return 0;
		return 1;
	}
	@Override
	public List<Member> selectMemberList() {
		// TODO Auto-generated method stub
		return dao.selectMemberList(session);
	}
	@Override
	public int selectMembercount() {
		// TODO Auto-generated method stub
		return dao.selectMembercount(session);
	}
	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return dao.deleteMember(session,userId);
	}
	@Override
	public int insertPointEnd(Point re) {
		// TODO Auto-generated method stub
		return dao.insertPointEnd(session,re);
	}
	@Override
	public int selectMemberPoint(String name) {
		// TODO Auto-generated method stub
		return dao.selectMemberPoint(session,name);
	}
	
	@Override
	public int updatePointEnd(Point re) {
		// TODO Auto-generated method stub
		return dao.updatePointEnd(session,re);
	}
	@Override
	public List<Report> adminReporttable() {
		// TODO Auto-generated method stub
		return dao.adminReporttable(session);
	}
	@Override
	public int selectReportCount() {
		// TODO Auto-generated method stub
		return dao.selectReportCount(session);
	}
	@Override
	public int reportUpdateYn(String pk) {
		// TODO Auto-generated method stub
		return dao.reportUpdateYn(session,pk);
	}
	@Override
	public List<Report> reportList(String userId) {
		// TODO Auto-generated method stub
		return dao.reportList(session,userId);
	}
	
	
}
