package com.twoweeks.spring.message.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.twoweeks.spring.member.model.vo.Member;
import com.twoweeks.spring.message.model.vo.Message;

import lombok.extern.slf4j.Slf4j;


@Repository
@Slf4j
public class MessageDaoImpl implements MessageDao {

	@Override
	public ArrayList<Message> messageList(SqlSession session, Message message) {
		String nick = message.getNick();
		
		//메세지 리스트 -가장 최근메세지, 보낸사람 프로필,보낸사람닉네임
		ArrayList<Message> list = (ArrayList) session.selectList("message.messagelist",message);

		for(Message msg : list ) {
			msg.setNick(nick);
			//사용자가 room에서 안읽은 메세지의 갯수를 가져옴
			int unread = session.selectOne("message.count_unread",msg);
			//사용자가 메세지를 주고받는 상대 프로필을 가져옴
			String profile = session.selectOne("message.get_profile",msg);
			//안읽은 메세지 갯수
			msg.setUnread(unread);
			//프로필
			msg.setProfile(profile);
			//메세지 상대 닉네임
			if(nick.equals(msg.getSend_nic())) {
				msg.setOther_nick(msg.getRecv_nic());
			}else {
				msg.setOther_nick(msg.getSend_nic());
			}					
		}
		return list;
	}

	@Override
	public ArrayList<Message> roomContentList(SqlSession session, Message message) {
		log.info("room={},recv_nick={},nick={}",message.getRoom(),message.getRecv_nic(),message.getNick());
		
		//메세지 내역
		ArrayList<Message> clist = (ArrayList)session.selectList("message.room_content_list",message);
		
		//해당 room의 메세지들 중 받는사람이 현재 사용자의 nick인 메세지를 모두 읽음 처리
		session.update("message.read_chk",message);
		System.out.println("clist ======"+clist);
		return clist;
	}

	@Override
	public int messageSendInlist(SqlSession session, Message message) {
		
		//메세지리스트 or 프로필에서 
		if(message.getRoom() ==0) { //프로필에서 보낸것
			int exist_chat =session.selectOne("message.exist_chat",message);
			//프로필에서 보낸것중 메세지 내역이 없어서 첫메세지가 될 경우 구분
			if(exist_chat==0) { //메세지 내역이 없어서 0이면 message테이블의 room 최댓값을 구해서 넣음
				int max_room = session.selectOne("message.max_room",message);
				message.setRoom(max_room+1);
			}else {//메세지 내역이 있다면 해당 room 번호를 찾아옴
				int room = Integer.parseInt(session.selectOne("message.select_room",message));
				message.setRoom(room);
			}
		}
		int result = session.insert("message.sendInlist",message);
		return result;
	}

	
	//메세지 알림
	public String countMessageView(SqlSession session, String user_Nic) {
		
		return session.selectOne("message.countMessageView",user_Nic);
	}

	
	//닉네임검색
	@Override
	public ArrayList<Member> searchNic(SqlSession session, String search_Nic) {
		ArrayList<Member> list = (ArrayList) session.selectList("message.searchNic", search_Nic);
		
		return list;
	}

	//룸번호찾기
	@Override
	public int searchRoom(SqlSession session, Message message) {
			String result  = session.selectOne("message.searchRoom", message);
			int room;
			if(result == null) {
				room = 0;
				
			}else {
				room = Integer.parseInt(result);				
			}
			return room;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
