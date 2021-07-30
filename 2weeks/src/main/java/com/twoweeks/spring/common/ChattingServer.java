package com.twoweeks.spring.common;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChattingServer extends TextWebSocketHandler{

	private Map<String, WebSocketSession> clients=new HashMap(); //이걸 DB에 저장해야 함.

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//onopen기능과 동일
		System.out.println("클라이언트 접속");
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//onmessage기능과 동일
		System.out.println(message);
			//session.open //이 없다!! 따로 websocketsession을 관리해줘야한다		
			//session.getAttributes().put //으로 해서 데이터를 집어넣을수도있다
		
		//데이터 전송하기
		session.sendMessage(message);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//onclose 기능과 동일
	}
	
	
	
}
