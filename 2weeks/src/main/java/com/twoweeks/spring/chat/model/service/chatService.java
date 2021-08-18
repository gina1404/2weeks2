package com.twoweeks.spring.chat.model.service;

import java.util.List;

import com.twoweeks.spring.chat.model.vo.ChatGroup;
import com.twoweeks.spring.chat.model.vo.ChatLog;

public interface chatService {
	
	int insertChatGroup(ChatGroup cg);
	
	List<ChatGroup> selectGroupList();
	
	int insertChatLog(ChatLog cl);
	
	int deleteChatLog(ChatLog cl);
	
	int selectGroupCurCnt(int no);
}
