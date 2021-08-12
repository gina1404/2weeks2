package com.twoweeks.spring.message;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.ctc.wstx.util.StringUtil;
import com.twoweeks.spring.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MessageHandler2 extends TextWebSocketHandler{
	
	//로그인 전체
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	//1대1
	Map<String, WebSocketSession> userSessionMap = new HashMap<String,WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		sessions.add(session);
		
		String user_Nic = searchUserNic(session);
		userSessionMap.put(user_Nic,session);
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		super.handleTextMessage(session, message);
		// TODO Auto-generated method stub
		String msg = message.getPayload();	
		log.info(msg);
		WebSocketSession recvSession = userSessionMap.get(msg);

		if(recvSession != null) {
			TextMessage tmpMsg = new TextMessage(
				 "새로운 매세지가 도착했습니다");
			recvSession.sendMessage(tmpMsg);
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		// TODO Auto-generated method stub
		userSessionMap.remove(session.getId());
		sessions.remove(session);
	}
	
	public String searchUserNic(WebSocketSession session)throws Exception {
        String user_Nic;
        Map<String, Object> map;
        map = session.getAttributes();
        Member loginUser = (Member)map.get("member");
  
        if(loginUser == null) {
        	return session.getId();
        }else {
        	return loginUser.getUser_Nic();
        }
        
    }
	

}
