package com.twoweeks.spring.board.freeboard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.board.freeboard.model.service.FreeBoardService;
import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.board.freeboard.model.vo.PostAttachment;
import com.twoweeks.spring.common.PageFactory;

@Controller
public class FreeBoardController {

	
	

	
	private static final Logger logger  = LoggerFactory.getLogger(FreeBoard.class);
	
	private FreeBoardService service;
	
	
	@GetMapping("/freeboard/boardList.do")
	public ModelAndView boardList(@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="5")int numPerpage,
			ModelAndView mv) {
		mv.addObject("list", service.selectBoardList(cPage,numPerpage)); 
		int totalData = service.selectBoardCount();  //등록된 테이블의 총 개수를 가져다가 저장
		mv.addObject("totalContents", totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, "boardList.do"));
		mv.setViewName("board/boardList");
		
		return mv;
	}
	
	
	
	
	@GetMapping("/freeboard/freeboardView.do")
	public String writeGet() {
		logger.info("write Get");
		return "freeBoard/write";
	}
	
	
	
	
	
	@PostMapping("/freeboard/fileupload.do") 
	public ModelAndView upload(FreeBoard b, @RequestParam("article_file") MultipartFile[] upload, ModelAndView mv,HttpServletResponse response, HttpServletRequest req) throws IOException {
	
		logger.debug("freeboard : "+ b);
		for(int i = 0; i<upload.length; i++) {
			logger.debug("fileName : " + upload[i].getOriginalFilename());
			logger.debug("fileName : " + upload[i].getSize());
		}
		
	String path = req.getServletContext().getRealPath("/resources/upload"); //resources/upload 경로 설정하여 path에 저장
	File dir = new File(path); //폴더
	if(!dir.exists()) {
		dir.mkdirs();
	}
	System.out.println("이거 돌아가니");
	
	for(MultipartFile f : upload) {
		//파일 있니
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
	String msg ="등록성공";
	try {
		service.insertBoard(b);
	}catch(Exception e) {
		msg= e.getMessage();
	}
	mv.addObject("msg",msg);
	mv.addObject("loc","/freeboard/boardList.do");
	mv.setViewName("common/msg");
	return mv;
	}
	
	
	
	
	
	
}
	
	


	
	 

	