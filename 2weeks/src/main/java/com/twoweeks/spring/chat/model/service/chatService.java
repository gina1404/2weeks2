package com.twoweeks.spring.chat.model.service;

import java.util.List;

import com.twoweeks.spring.chat.model.vo.ChatGroup;

public interface chatService {
	
	int insertChatGroup(ChatGroup cg);
	
	List<ChatGroup> selectGroupList();

}
