package com.twoweeks.spring.board.freeboard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.board.freeboard.model.service.FreeBoardService;
import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.board.freeboard.model.vo.PostAttachment;
import com.twoweeks.spring.common.PageFactory;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FreeBoardController {

	
	@Autowired
	private FreeBoardService service;
	
	
	
	@GetMapping("/freeboard/searchBoard.do")
	public ModelAndView searchBoard(ModelAndView mv, FreeBoard fb, HttpServletRequest request, HttpSession session,
			@RequestParam(value="cPage", defaultValue="1") int cPage, @RequestParam(value="numPerpage",defaultValue="5") int numPerpage) {
		String type= request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		
		Map<String,Object> param=new HashMap<String,Object>();
		param.put("type", type);
		param.put("keyword", keyword);
		param.put("user", request.getParameter("user_Id"));
		
		mv.addObject("list", service.searchBoard(param));
		
		System.out.println(service.searchBoard(param)); 
		
		mv.setViewName("freeBoard/searchBoardList");
		
		
		return mv;
	}
	
	@RequestMapping("/freeboard/boardList.do")
	public ModelAndView boardList(@RequestParam(value="cPage", defaultValue="1") int cPage,@RequestParam(value="numPerpage",defaultValue="5")int numPerpage,
			ModelAndView mv) {
		log.info("어어어어");
		log.debug("게시판 리스트");
		mv.addObject("list", service.listAll(cPage,numPerpage)); 
		int totalData = service.totalBoardCount();  //등록된 테이블의 총 개수를 가져다가 저장
		mv.addObject("totalContents", totalData);
		log.debug("");
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, "boardList.do"));
		mv.setViewName("freeBoard/boardList");
		
		return mv;
	}
	
	
	
	@PostMapping("/freeboard/writeEnd.do") 
	public ModelAndView writeEnd(FreeBoard b, @RequestParam("article_file") MultipartFile[] upload, MultipartFile[] file, ModelAndView mv,HttpServletResponse response, HttpServletRequest req) throws IOException {
		log.info("freeboard : "+ b.toString());
		for(int i = 0; i<file.length; i++) {
			log.info("fileName : " + file[i].getOriginalFilename());
			log.info("fileName : " + file[i].getSize());
		}
		
	String path = req.getServletContext().getRealPath("/resources/upload/freeboard/"); //resources/upload 경로 설정하여 path에 저장
	File dir = new File(path); //폴더
	if(!dir.exists()) {
		dir.mkdirs();
	}
	
	for(MultipartFile f : file) {
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
	
	
	@RequestMapping("/freeboard/readView")
	public String read(FreeBoard fb, Model model,  HttpServletRequest request) {
		log.info("read");
		log.info("list" + fb.getAttachments());
		fb.setPost_Sq(Integer.parseInt(request.getParameter("no")));
				
		model.addAttribute("list", service.read(fb.getPost_Sq()));
		
		return "freeBoard/readView";
	}
	
	
	@RequestMapping("/freeboard/delete.do")
	public String delete(int no) {
		log.info("delete");
		
		System.out.println(no);
		service.delete(no);
		
		return "redirect:/freeboard/boardList.do";
	}
	
	
	
	@RequestMapping("/freeboard/update")
	public ModelAndView update(ModelAndView mv,FreeBoard fb,@RequestParam("article_file") MultipartFile[] upload, HttpServletRequest request,  MultipartFile[] file) {
		log.info("update 수정좀하자");
		
		for(int i=0; i<file.length; i++) {
            log.info("================== file start ==================");
            log.info("파일 이름: "+file[i].getName());
            log.info("파일 실제 이름: "+file[i].getOriginalFilename());
            log.info("파일 크기: "+file[i].getSize());
            log.info("content type: "+file[i].getContentType());
            log.info("================== file   END ==================");

		}
		
		String path = request.getServletContext().getRealPath("/resources/upload/freeboard/"); //resources/upload 경로 설정하여 path에 저장
		File dir = new File(path); //폴더
		String reName="";
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		for(MultipartFile f : file) {
			//파일 있니
			if(!f.isEmpty()) {
				String oriFileName = f.getOriginalFilename();
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndNum=(int)Math.random()*10000000;
				String front = "2Weeks_";
				reName = front+sdf.format(System.currentTimeMillis())+"_"+rndNum+ext;
				try {
					f.transferTo(new File(path+reName));
					List<PostAttachment> list = fb.getAttachments();
					list.add(PostAttachment.builder().atch_Ori(oriFileName).atch_New(reName).build());
					//fb.getAttachments().add(PostAttachment.builder().atch_Ori(oriFileName).atch_New(reName).build());
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
		  }
		String msg ="등록성공";
		try {
			log.info("================== update start ==================");
			service.update(fb);
		}catch(Exception e) {
			//FileUtils.deleteQuietly(new File(path+reName));  //저장된 현재 파일 삭제
			msg= e.getMessage();
		}
		//수정후에 수정한 게시물 페이지에 있어야한다. 어떻게 해야할까?
		//readView로 보내보자
		mv.addObject("no", request.getParameter("post_Sq"));
		log.info("list" + fb.getAttachments());
		 mv.addObject("msg",msg); mv.addObject("loc","/freeboard/readView"); //common/msg에 넣어버리면 location.replace라서 작동안됨.
		 
		//redirect로 수정한 게시물을 보여준다.
		mv.setViewName("common/msg");
		return mv;
		}
	
	
	@RequestMapping("/freeboard/updateBoard.do")
	public String updateEnd(FreeBoard fb, Model model,  HttpServletRequest request) {
		
		log.info("updateEnd");
		
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(no+"인가요?");
		fb.setPost_Sq(Integer.parseInt(request.getParameter("no")));
				
		model.addAttribute("list", service.read(fb.getPost_Sq()));
		
		
		
		return "freeBoard/updateView";
				
		
	}
	
	@RequestMapping("/freeboard/write.do")
	public String write() {
		return "freeBoard/write";
	}
	
}
	
	


	
	 

	