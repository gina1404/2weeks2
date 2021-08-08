package com.twoweeks.spring.common;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChattingServer extends TextWebSocketHandler{

	//private Map<String, WebSocketSession> clients=new HashMap(); //이걸 DB에 저장해야 함.

	private static Logger logger=org.slf4j.LoggerFactory.getLogger(ChattingServer.class);
	
	private List<WebSocketSession> sessionList=new ArrayList<WebSocketSession>();
		
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		logger.info(" {} connected ", session.getId());
		
		log.info(session.getPrincipal().getName()+"님이 입장했습니다.");		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("From {}, recieved Message : {} ", session.getId(), message.getPayload());
				
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(session.getPrincipal().getName()+" : "+message.getPayload()));			
		}
		
		//데이터 전송하기
		session.sendMessage(message);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info(session.getPrincipal().getName()+"님이 나갔습니다.");
		
		sessionList.remove(session);
		logger.info(" {} Coneection Closed ", session.getId());
	}
	
	
	
}
