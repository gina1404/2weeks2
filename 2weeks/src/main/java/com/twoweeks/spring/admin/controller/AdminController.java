package com.twoweeks.spring.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.twoweeks.spring.covid.controller.CovidUpdateController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	@RequestMapping("/admin/adminPageList")
	public String adminPage() {
		return "admin/adminMainPage";
	}
	@RequestMapping("/admin/admintable.do")
	public String admintable() {
		return "/admin/admintable";
	}
	@RequestMapping("/admon/NoticeWriter.do")
	public String adminNotice() {
		return "admin/adminNoticeWriter";
	}
}
