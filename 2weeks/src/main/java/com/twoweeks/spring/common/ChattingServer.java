package com.twoweeks.spring.common;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.twoweeks.spring.chat.model.vo.ChatGroupMessage;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChattingServer extends TextWebSocketHandler{
	
	private List<WebSocketSession> sessionList=new ArrayList<WebSocketSession>();
		
	Gson gson=new Gson();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);				
				
		String sender=(String)session.getAttributes().get("chatName");
		
		log.info("{}님 입장",sender);
		
//		//ChatGroupMessage msg=gson.fromJson(message.getPayload(), ChatGroupMessage.class); //Json을 java객체로 바꿔줌
//		
//		TextMessage sendMsg= new TextMessage(gson.toJson(msg));
//		
//		for(WebSocketSession s : sessionList) {
//			s.sendMessage(sendMsg);
//		}
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("====서버메세지====");		
		String sender=(String)session.getAttributes().get("chatName");
				
		log.info("{}님이 {}메세지 전송함", sender, message.getPayload());		
		
		ChatGroupMessage msg=gson.fromJson(message.getPayload(), ChatGroupMessage.class); //Json을 java객체로 바꿔줌
				
		TextMessage sendMsg= new TextMessage(gson.toJson(msg));
		
		for(WebSocketSession s : sessionList) {
			s.sendMessage(sendMsg);
		}	
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);	
	}
}
