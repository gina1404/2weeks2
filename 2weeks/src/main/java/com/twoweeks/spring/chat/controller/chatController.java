package com.twoweeks.spring.chat.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.twoweeks.spring.chat.model.vo.ChatGroup;

@Controller
public class chatController {

	//@Autowired
	//private chatServiceImpl service;
	
	@RequestMapping(value="/chat/sendChat", produces="application/json")
	@ResponseBody
//	@PostMapping(value="/chat/sendChat", produces = "application/json")
	//public String insertChat(@RequestBody ChatGroup cg ) {
	public String insertChat(@RequestParam ChatGroup cg) {
		//System.out.println(cg);
		List<ChatGroup> cgList=new ArrayList<ChatGroup>();
		cgList.add(cg);
		System.out.println(cgList);
		return "/";
	}
	
	
}
