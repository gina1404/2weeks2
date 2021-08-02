package com.twoweeks.spring.chat.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.twoweeks.spring.chat.model.vo.ChatGroup;

public interface ChatDao {

	int insertChatGroup(SqlSession session, ChatGroup cg);
	
	List<ChatGroup> selectGroupList(SqlSession session);
}
