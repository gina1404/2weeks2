package com.twoweeks.spring.board.freeboard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.twoweeks.spring.board.freeboard.model.service.FreeBoardService;
import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;

@Controller
public class FreeBoardController {

	
	private static final Logger logger  = LoggerFactory.getLogger(FreeBoard.class);
	
	private FreeBoardService service;
	
	@GetMapping("/freeboard/freeboardView.do")
	public String writeGet() {
		logger.info("write Get");
		return "freeBoard/write";
		
		
	}
	
	@GetMapping()
	public ModelAndView writePost(FreeBoard freeBoard, ModelAndView mv) throws Exception {
		
		logger.info("write POST...");
		logger.info(freeBoard.toString());
		int result = service.create(freeBoard);
		String msg ="";
		String loc ="";
		if(result > 0) {
			System.out.println("게시글 등록 성공");
			mv.addObject("msg", "게시글 등록 성공");
			mv.addObject("loc", "redirect:/freeBoard/boardList");
		}
		mv.setViewName("common/msg");
		
		return mv;
	}
	
}
