package com.twoweeks.spring.message.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.twoweeks.spring.member.model.vo.Member;
import com.twoweeks.spring.message.model.vo.Message;

public interface MessageDao {
	
	public ArrayList<Message> messageList(SqlSession session, Message message);
	
	public ArrayList<Message> roomContentList(SqlSession session,Message message);
	
	public int messageSendInlist(SqlSession session,Message message);
	
	//메세지알림
	public String countMessageView(SqlSession session,String user_Nic);
	
	public ArrayList<Member> searchNic(SqlSession session,String search_Nic);
	
	public int searchRoom(SqlSession session, Message message);

}
