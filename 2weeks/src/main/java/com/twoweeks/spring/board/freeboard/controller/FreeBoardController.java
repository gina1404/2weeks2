package com.twoweeks.spring.board.freeboard.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.board.freeboard.model.service.FreeBoardService;
import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.board.freeboard.model.vo.PostAttachment;

@Controller
public class FreeBoardController {

	
	private static final Logger logger  = LoggerFactory.getLogger(FreeBoard.class);
	
	private FreeBoardService service;
	
	@GetMapping("/freeboard/freeboardView.do")
	public String writeGet() {
		logger.info("write Get");
		return "freeBoard/write";
	}
	
	
	
	@PostMapping("/freeboard/fileupload.do") 
	public ModelAndView upload(FreeBoard b, MultipartFile[] upload, ModelAndView mv,HttpServletResponse response, HttpServletRequest req) throws IOException {
	String path = req.getServletContext().getRealPath("/resources/upload");

	File dir = new File(path);
	
	if(!dir.exists()) {
		dir.mkdirs();
	}
	
	for(MultipartFile f : upload) {
		if(!f.isEmpty()) {
			String oriFileName = f.getOriginalFilename();
			String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndNum=(int)Math.random()*10000000;
			String front = "2Weeks_";
			String reName = front+sdf.format(System.currentTimeMillis())+"_"+rndNum+ext;
			
			try {
				f.transferTo(new File(path+reName));
				b.getAttachments().add(PostAttachment.builder().atch_Ori(oriFileName).atch_New(reName).build());
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
	  }
	return mv;
	}
	
	
	
	
	
	
}
	
	


	
	 

	