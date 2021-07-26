package com.twoweeks.spring.know.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.twoweeks.spring.know.controller.KnowledgeInController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class KnowledgeInController {
	@RequestMapping("/KnowledgeIn/KnowledgeInMain.do") //弃歹/林家
	public String KnowledgeInMain(){
		return "KnowledgeIn/KnowledgeInMain";
	}
	
	@RequestMapping("/KnowledgeIn/KnowledgeInList.do") //弃歹/林家
	public String KnowledgeInList(){
		return "KnowledgeIn/KnowledgeInList";
	}
	
	@RequestMapping("/KnowledgeIn/KnowledgeInA.do") //弃歹/林家
	public String KnowledgeInA(){
		return "KnowledgeIn/KnowledgeInA";

	}
	@RequestMapping("/KnowledgeIn/KnowledgeInQ.do") //弃歹/林家
	public String KnowledgeInQ(){
		return "KnowledgeIn/KnowledgeInQ";
	}
	@RequestMapping("/KnowledgeIn/KnowledgeInMyList.do") //弃歹/林家
	public String KnowledgeInMyList(){
		return "KnowledgeIn/KnowledgeInMyList";
	}
	
}
