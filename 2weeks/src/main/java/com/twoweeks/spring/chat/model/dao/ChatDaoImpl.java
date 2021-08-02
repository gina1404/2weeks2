package com.twoweeks.spring.chat.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.twoweeks.spring.chat.model.vo.ChatGroup;

@Repository
public class ChatDaoImpl implements ChatDao{

	@Override
	public int insertChatGroup(SqlSession session, ChatGroup cg) {		
		return session.insert("chat.insertChatGroup", cg);
	}

	@Override
	public List<ChatGroup> selectGroupList(SqlSession session) {		
		return session.selectList("chat.selectGroupList");
	}

	
}
