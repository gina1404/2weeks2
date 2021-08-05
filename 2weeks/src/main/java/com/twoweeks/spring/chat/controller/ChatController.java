package com.twoweeks.spring.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.twoweeks.spring.chat.model.service.ChatServiceImpl;
import com.twoweeks.spring.chat.model.vo.ChatGroup;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {

	@Autowired
	private ChatServiceImpl service;
	
	@RequestMapping("/chatting.do")
	public String moveChatPage(Model model) {
//		Member user=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		//user.setUserId("admin");
//		//user.setUserName("관리자");
//		
//		log.info("==================");
//		log.info("@ChatController, GET Chat / Username : "+user.getUserName());
		
		List<ChatGroup> list=service.selectGroupList();		
		model.addAttribute("list", list);
		
		return "chat/chatting";
	}
	
	@RequestMapping(value="/chat/sendChat", produces="application/json")
	@ResponseBody
	public String insertChat(@RequestBody ChatGroup cg, Model m) {	
		
		cg.setMaker("admin");
		int result=service.insertChatGroup(cg);
		
		String check="";
		if(result>0) check="채팅방만들기 성공";			
		else check="채팅방만들기 실패";
			
		m.addAttribute("check", check);
		return "chat/chatting";
	}
	
    @RequestMapping("/GroupChatting.do")        
    public String groupChattingEntry(@RequestParam int no, Model m) {
        m.addAttribute("no", no);
        return "chat/chattingEntry";
	}
	
	
	
	
}
