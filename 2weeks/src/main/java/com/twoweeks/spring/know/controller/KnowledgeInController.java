package com.twoweeks.spring.know.controller;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.common.PageFactory;
import com.twoweeks.spring.know.model.service.KnowledgeInService;
import com.twoweeks.spring.know.model.vo.Kin;
import com.twoweeks.spring.know.model.vo.KinAttachment;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class KnowledgeInController {
    private static final Logger logger  = LoggerFactory.getLogger(Kin.class);
	@Autowired
	private KnowledgeInService service;
	
	@RequestMapping("/KnowledgeIn/KnowledgeInMain.do") //지식인메인
	
	public ModelAndView KnowledgeInMain(
			@RequestParam(value="cPage", defaultValue="1") int  cPage,
			@RequestParam(value="numPerpage",defaultValue="6") int numPerpage,
	
			ModelAndView mv){
		mv.addObject("list",service.selectKinList(cPage,numPerpage));
		int totalData=service.selectKinCount();//등록된 테이블의 총 개수를 가져다가 저장
		mv.addObject("totalContents",totalData); 
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, "KnowledgeInMain.do"));
		mv.setViewName("KnowledgeIn/KnowledgeInMain");
		
		return mv;
	}
	
	@RequestMapping("/KnowledgeIn/KnowledgeInList.do") //지식인 글 상세보기	
		public ModelAndView KnowledgeInList(@RequestParam(value="sq", defaultValue="1") int sq, ModelAndView mv) {
			mv.addObject("KnowledgeIn",service.selectKinOne(sq));
			mv.setViewName("KnowledgeIn/KnowledgeInList");
			return mv;
	
	}
	
	@RequestMapping(value= "/delete" ,method= RequestMethod.GET)
	public ModelAndView delete(Kin k )throws Exception{
		service.deleteKin(k.getKin_Sq());
		
		ModelAndView mv= new ModelAndView("redirect:/Knowledge/KnowledgeInMain.do");
		
		return mv;
	}
	
	
	@RequestMapping("/KnowledgeIn/KnowledgeInA.do") //지식인 답변
	public ModelAndView KnowledgeInA(@RequestParam(value="sq", defaultValue="1") int sq, ModelAndView mv){
		mv.addObject("KnowledgeIn",service.selectKinOne(sq));
		mv.setViewName("KnowledgeIn/KnowledgeInA");
		return mv;

	}
	
	@RequestMapping("/KnowledgeIn/KnowledgeInQ.do") //지식인 질문화면
	public String KnowledgeInQ(){
		return "KnowledgeIn/KnowledgeInQ";
}
	
	
	@RequestMapping("/KnowledgeIn/KnowledgeInQEnd.do") //지식인 질문등록
		 public ModelAndView insertKin(Kin k,MultipartFile[] upload, 
				   ModelAndView mv,HttpServletResponse response, HttpServletRequest  req) throws IOException {
		             
	      logger.debug("knowledgIn : "+ k);
	      for(int i = 0; i<upload.length; i++) {
	          logger.debug("fileName : " + upload[i].getOriginalFilename());
	          logger.debug("fileName : " + upload[i].getSize());
	      }
	      
	  String path = req.getServletContext().getRealPath("/resources/upload");
	  File dir = new File(path); //폴더
	  if(!dir.exists()) {
	      dir.mkdirs();
	  }
	  
		for(MultipartFile f : upload) {
	      
	  	if(!f.isEmpty()) {
	  		String oriFilename=f.getOriginalFilename();
				String ext=oriFilename.substring(oriFilename.lastIndexOf("."));
	
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndNum=(int)(Math.random()*10000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+rndNum+ext;
	        
			
			try {
				f.transferTo(new File(path+reName));
	
				
				k.getAttachments().add(KinAttachment.builder()
						.atch_Ori(oriFilename)
						.atch_New(reName).build());
				
			}catch(IOException e) {
				e.printStackTrace();
			}
	
	  		}//for문 종료
	  }//if문 종료
			String msg="등록 성공";
			try {
					service.insertKin(k);
			}catch(Exception e) {
				msg=e.getMessage();
			}
	
		mv.addObject("msg",msg);
		mv.addObject("loc","/KnowledgeIn/KnowledgeInMain.do");
		mv.setViewName("common/msg");
	
		return mv;
	}
	
	@RequestMapping("/KnowledgeIn/KnowledgeInMyList.do") //나의 질문,답변
	public String KnowledgeInMyList(){
		return "KnowledgeIn/KnowledgeInMyList";
	}

	
	
		
}
