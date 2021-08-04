package com.twoweeks.spring.admin.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twoweeks.spring.admin.model.dao.AdminDao;
import com.twoweeks.spring.admin.model.vo.Notice;
import com.twoweeks.spring.admin.model.vo.noticeAttachment;

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
	
	
}
