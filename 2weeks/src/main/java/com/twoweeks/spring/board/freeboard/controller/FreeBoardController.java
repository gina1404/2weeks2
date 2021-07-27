package com.twoweeks.spring.board.freeboard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeBoardController {
	
	
	@GetMapping("/board/freeBoard.do")
	public ModelAndView freeBoardView(ModelAndView mv) {
		
		
		mv.setViewName("freeBoard/freeBoardView");
		return mv;
	}
	
}
