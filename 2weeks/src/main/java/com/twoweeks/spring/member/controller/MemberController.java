package com.twoweeks.spring.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	
	@RequestMapping("/signup")
	public String SignUp() {
		return "/member/signup";
	}

}
