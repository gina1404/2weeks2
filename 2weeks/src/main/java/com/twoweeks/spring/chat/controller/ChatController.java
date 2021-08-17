package com.twoweeks.spring.chat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.twoweeks.spring.chat.model.service.ChatServiceImpl;
import com.twoweeks.spring.chat.model.vo.ChatGroup;
import com.twoweeks.spring.chat.model.vo.ChatLog;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {

	@Autowired
	private ChatServiceImpl service;
	
	@RequestMapping("/chatting.do")
	public String moveChatPage(HttpSession session, Model model) {		
		List<ChatGroup> list=service.selectGroupList();		
		
		for(ChatGroup l : list) {
			int curCnt=service.selectGroupCurCnt(l.getGroupNo());
			l.setCurCnt(curCnt);
		}		
		
		model.addAttribute("list", list);		
		
		return "chat/chatMain";
	}

	@ResponseBody
	@RequestMapping("/deleteChatLog")
	public String deleteChatLog(@RequestBody String no, HttpSession session){
		String chatId=(String)session.getAttribute("chatId");
		System.out.println("chatId=loginId : "+chatId);
		int chatNo=Integer.parseInt(no.substring(no.indexOf(",")+4));
		
		ChatLog cl=new ChatLog(chatNo, chatId);

		int result=service.deleteChatLog(cl);

		return "chat/chatMain";
	}
	
	@RequestMapping(value="/chat/sendChat", produces="application/json")
	@ResponseBody
	public String insertChat(@RequestBody ChatGroup cg, Model m, HttpSession session) {		
		
		int result=service.insertChatGroup(cg);
		
		String check="";
		if(result>0) check="채팅방만들기 성공";			
		else check="채팅방만들기 실패";
			
		m.addAttribute("check", check);
		
		return "chat/chatMain";		
	}
	
	@RequestMapping("/addChatRoom")
	public String addChatRoom(HttpSession session, Model m) {	
		String chatId=(String)session.getAttribute("chatId");
		m.addAttribute("chatId", chatId);
		
		return "chat/addChatRoom";
	}	
	
    @RequestMapping("/chatting")        
    public String groupChattingEntry(@RequestParam int no, HttpSession session, Model m) {        
    	String chatId=(String)session.getAttribute("chatId");
    	String chatName=(String)session.getAttribute("chatName");
    	//System.out.println("/////"+chatId+"   "+chatName);
        
        m.addAttribute("no", no);
        m.addAttribute("loginId", chatId);
        m.addAttribute("chatName", chatName);
        
        return "chat/chattingEntry";
	}
		
}