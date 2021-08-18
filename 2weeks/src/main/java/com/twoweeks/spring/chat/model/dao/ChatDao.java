package com.twoweeks.spring.chat.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.twoweeks.spring.chat.model.vo.ChatGroup;
import com.twoweeks.spring.chat.model.vo.ChatLog;

public interface ChatDao {

	int insertChatGroup(SqlSession session, ChatGroup cg);
	
	List<ChatGroup> selectGroupList(SqlSession session);
	
	int insertChatLog(SqlSession session, ChatLog cl);
	
	int deleteChatLog(SqlSession session, ChatLog cl);
	
	int selectGroupCurCnt(SqlSession session, int no);
}
