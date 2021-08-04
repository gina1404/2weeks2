package com.twoweeks.spring.know.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.twoweeks.spring.know.controller.KnowledgeInController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class KnowledgeInController {
	@RequestMapping("/KnowledgeIn/KnowledgeInMain.do") //����/�ּ�
	public String KnowledgeInMain(){
		return "KnowledgeIn/KnowledgeInMain";
	}
	
	@RequestMapping("/KnowledgeIn/KnowledgeInList.do") //����/�ּ�
	public String KnowledgeInList(){
		return "KnowledgeIn/KnowledgeInList";
	}
	
	@RequestMapping("/KnowledgeIn/KnowledgeInA.do") //����/�ּ�
	public String KnowledgeInA(){
		return "KnowledgeIn/KnowledgeInA";

	}
	@RequestMapping("/KnowledgeIn/KnowledgeInQ.do") //����/�ּ�
	public String KnowledgeInQ(){
		return "KnowledgeIn/KnowledgeInQ";
	}
	@RequestMapping("/KnowledgeIn/KnowledgeInMyList.do") //����/�ּ�
	public String KnowledgeInMyList(){
		return "KnowledgeIn/KnowledgeInMyList";
	}

	
	
		
}
