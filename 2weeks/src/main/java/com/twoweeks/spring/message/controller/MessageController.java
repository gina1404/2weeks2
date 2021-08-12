package com.twoweeks.spring.message.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.twoweeks.spring.member.model.vo.Member;
import com.twoweeks.spring.message.model.service.MessageService;
import com.twoweeks.spring.message.model.vo.Message;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	
	//메세지 목록
	@RequestMapping("/message/messagelist")
	public String messageList(
			HttpServletRequest request, HttpSession session,Model model) {
//		Enumeration<String> attributes = request.getSession().getAttributeNames();
//		while (attributes.hasMoreElements()) {
//		    String attribute = (String) attributes.nextElement();
//		    System.err.println(attribute+" : "+request.getSession().getAttribute(attribute));
//		}
		
		Member memberSession = (Member)session.getAttribute("member");
		String nick = memberSession.getUser_Nic();
		log.info(nick);
		
		Message message = new Message();
		message.setNick(nick);
		
		//메세지 리스트
		ArrayList<Message> list = messageService.messageList(message);
		
		//request.setAttribute("list", list);
		model.addAttribute("list", list);
		
		return "/message/messagelist";
	}
	
	@RequestMapping("/message/message_ajax_list")
	public String message_ajax_list(HttpServletRequest request, HttpSession session,Model model) {
		Member memberSession = (Member)session.getAttribute("member");
		String nick = memberSession.getUser_Nic();
		log.info("닉네임={}",nick);
		
		Message message = new Message();
		message.setNick(nick);
		
		ArrayList<Message> list = messageService.messageList(message);
		//request.setAttribute("list", list);
		model.addAttribute("list", list);
		return "message/message_ajaxlist";
	}
	
	@RequestMapping("/message/message_content_list")
	public String message_content_list(HttpServletRequest request, HttpSession session,Model model) {
		int room = Integer.parseInt(request.getParameter("room"));
		Member memberSession = (Member)session.getAttribute("member");
		String nick= memberSession.getUser_Nic();
		
		Message message = new Message();
		message.setRoom(room);
		message.setNick(nick);
		
		//메세지내용
		ArrayList<Message> clist = messageService.roomContentList(message);
		//request.setAttribute("clist", clist);
		model.addAttribute("clist", clist);
		System.out.println(clist);
		return "message/message_contentlist";
		
		
	}
	//메세지리스트에서 메세지 발송
	@ResponseBody
	@RequestMapping("/message/message_send_inlist")
	public int message_send_inlist(
			//@RequestParam int room, @RequestParam("other_nick") String other_nic,
			//@RequestParam String content,
			@RequestBody Message message,
			HttpSession session) {
		Member memberSession = (Member)session.getAttribute("member");
		String nick = memberSession.getUser_Nic();
		//log.info("room={},other_nic ={} ,content={}",room,other_nic,content);
		log.info("room={},other_nic ={} ,content={}",message.getRoom(),message.getOther_nick(),message.getContent());
					
		//Message message = new Message();
		//message.setRoom(room);
		message.setSend_nic(nick);
		message.setRecv_nic(message.getOther_nick());
		//message.setContent(content);
		log.info(message.toString());
		
		int result =messageService.messageSendInlist(message);
		
	
	return result;
	}
	
	
	//닉네임 검색 팝업 이동
	@RequestMapping("/message/searchNic")
	public String openSearch(
			@RequestParam("user_Nic") String search_Nic, Model model) {
			//log.info("유저닉네임 검색 ={}",user_Nic);
		ArrayList<Member> nicList = messageService.searchNic(search_Nic);
		System.out.println(nicList);
		model.addAttribute("search_Nic",search_Nic);
		model.addAttribute("nicList", nicList);
		
		
		return "message/searchNic";
	}
	
	@GetMapping("/message/send_msg")
	public String sendMsg(
			Message message,
			Model model){
		//log.info("message send msg ={} ={}",message.getRecv_nic(),message.getSend_nic());
		int room = messageService.searchRoom(message);
		log.info("room={} " ,room);
		model.addAttribute("recv_nic", message.getRecv_nic());
		model.addAttribute("room", room);
		return "/message/send_msg";
	}
	
}
