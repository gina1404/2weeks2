package com.twoweeks.spring.chat.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twoweeks.spring.chat.model.dao.ChatDaoImpl;
import com.twoweeks.spring.chat.model.vo.ChatGroup;
import com.twoweeks.spring.chat.model.vo.ChatLog;

@Service
public class ChatServiceImpl implements chatService{

	@Autowired
	private ChatDaoImpl dao;
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertChatGroup(ChatGroup cg) {		
		return dao.insertChatGroup(session, cg);
	}

	@Override
	public List<ChatGroup> selectGroupList() {		
		return dao.selectGroupList(session);
	}

	@Override
	public int insertChatLog(ChatLog cl) {
		return dao.insertChatLog(session, cl);
	}

	@Override
	public int deleteChatLog(ChatLog cl) {
		return dao.deleteChatLog(session, cl);
	}

	@Override
	public int selectGroupCurCnt(int no) {
		return dao.selectGroupCurCnt(session, no);
	}
	
	
	
}
