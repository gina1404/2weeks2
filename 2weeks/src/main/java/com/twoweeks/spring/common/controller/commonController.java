package com.twoweeks.spring.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class commonController {

	@RequestMapping("/home.do")
	public String goHome() {
		return "index";
	}
}
