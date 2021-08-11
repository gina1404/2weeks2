package com.twoweeks.spring.message.model.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twoweeks.spring.member.model.vo.Member;
import com.twoweeks.spring.message.model.dao.MessageDao;
import com.twoweeks.spring.message.model.vo.Message;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageDao messageDao;
	
	@Autowired
	private SqlSession session;

	@Override
	public ArrayList<Message> messageList(Message message) {
		
		return messageDao.messageList(session,message);
	}

	@Override
	public ArrayList<Message> roomContentList(Message message) {
		
		return messageDao.roomContentList(session,message);
	}

	@Override
	public int messageSendInlist(Message message) {
		
		return messageDao.messageSendInlist(session,message);
	}

	//메세지알림
	@Override
	public String countMessageView(String user_Nic) {
		
		return messageDao.countMessageView(session,user_Nic);
	}

	@Override
	public ArrayList<Member> searchNic(String search_Nic) {
		
		return messageDao.searchNic(session,search_Nic);
	}

	//룸번호찾기
	@Override
	public int searchRoom(Message message) {
		// TODO Auto-generated method stub
		return messageDao.searchRoom(session, message);
	}
	
	
	
	
	
	
	
	

}
