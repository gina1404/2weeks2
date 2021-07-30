package com.twoweeks.spring.covid.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChattingController {

	@RequestMapping("/chatting.do")
	public String moveChatPage() {
		return "chatting";
	}
	
}
