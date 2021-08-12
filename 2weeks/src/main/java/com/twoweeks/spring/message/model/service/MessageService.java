package com.twoweeks.spring.message.model.service;

import java.util.ArrayList;
import java.util.List;

import com.twoweeks.spring.member.model.vo.Member;
import com.twoweeks.spring.message.model.vo.Message;


public interface MessageService {
	
	public ArrayList<Message> messageList(Message message);
	
	public ArrayList<Message> roomContentList(Message message);
	
	public int messageSendInlist(Message message);
	
	public String countMessageView(String user_Nic);
	
	public ArrayList<Member> searchNic(String search_Nic);
	
	public int searchRoom(Message message);
	

}
