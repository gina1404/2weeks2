package com.twoweeks.spring.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.admin.model.vo.Notice;
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
	@RequestMapping("/admin/NoticeForm.do")
	public ModelAndView	insertNotice(Notice n,ModelAndView mv,MultipartFile upload) {
		
		return mv;
	}
}
