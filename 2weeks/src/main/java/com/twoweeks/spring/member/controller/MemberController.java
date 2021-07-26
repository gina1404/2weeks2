package com.twoweeks.spring.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.twoweeks.spring.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/signup")
	public String SignUp() {
		return "/member/signup";
	}
	
	//아이디중복체크
	@GetMapping("/member/idCheck")
	@ResponseBody
	public int idCheck(
			@RequestParam("userId")String userId) {
		
		return memberService.idCheck(userId);
	}
	
	

}
