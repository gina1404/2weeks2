package com.twoweeks.spring.know.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.twoweeks.spring.common.PageFactory;
import com.twoweeks.spring.know.model.service.KnowledgeInService;
import com.twoweeks.spring.know.model.vo.Kin;
import com.twoweeks.spring.know.model.vo.KinAttachment;
import com.twoweeks.spring.know.model.vo.KinReply;
import com.twoweeks.spring.know.model.vo.KinReplyAttachment;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class KnowledgeInController {
	private static final Logger logger = LoggerFactory.getLogger(Kin.class);
	@Autowired
	private KnowledgeInService service;

	@RequestMapping("/KnowledgeIn/KnowledgeInMain.do") // 지식인메인

	public ModelAndView KnowledgeInMain(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "6") int numPerpage,

			ModelAndView mv) {
		mv.addObject("list", service.selectKinList(cPage, numPerpage));
		int totalData = service.selectKinCount();// 등록된 테이블의 총 개수를 가져다가 저장
		mv.addObject("totalContents", totalData);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage, "KnowledgeInMain.do"));
		mv.setViewName("KnowledgeIn/KnowledgeInMain");

		return mv;
	}

	@RequestMapping("/KnowledgeIn/KnowledgeInList.do") // 지식인 글 상세보기
	public ModelAndView KnowledgeInList(@RequestParam(value = "sq", defaultValue = "1") int sq, ModelAndView mv)
			throws Exception {
		mv.addObject("KnowledgeIn", service.selectKinOne(sq));
		mv.setViewName("KnowledgeIn/KnowledgeInList");
		return mv;

	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("sq") int sq) throws Exception {
		service.delete(sq);

		return "redirect:/KnowledgeIn/KnowledgeInMain.do";

	}

	@RequestMapping("/KnowledgeIn/KnowledgeInA.do") // 지식인 답변
	public ModelAndView KnowledgeInA(@RequestParam(value = "sq", defaultValue = "1") int sq, ModelAndView mv)
			throws Exception {
		mv.addObject("KnowledgeIn", service.selectKinOne(sq));
		mv.setViewName("KnowledgeIn/KnowledgeInA");
		return mv;

	}

	@RequestMapping("/KnowledgeIn/KnowledgeInQ.do") // 지식인 질문작성화면
	public String KnowledgeInQ() {
		return "KnowledgeIn/KnowledgeInQ";
	}

	@RequestMapping("/KnowledgeIn/KnowledgeInQEnd.do") // 지식인 질문등록
	public ModelAndView insertKin(Kin k, @RequestParam("article_file") MultipartFile[] upload, MultipartFile[] file,
			ModelAndView mv, HttpServletResponse response, HttpServletRequest req) throws IOException {

		logger.debug("knowledgIn : " + k);
		for (int i = 0; i < upload.length; i++) {
			logger.debug("fileName : " + file[i].getOriginalFilename());
			logger.debug("fileName : " + file[i].getSize());
		}

		String path = req.getServletContext().getRealPath("/resources/upload/knowledgeIn");
		File dir = new File(path); // 폴더
		if (!dir.exists()) {
			dir.mkdirs();
		}

		for (MultipartFile f : file) {

			if (!f.isEmpty()) {
				String oriFilename = f.getOriginalFilename();
				String ext = oriFilename.substring(oriFilename.lastIndexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndNum = (int) Math.random() * 10000000;
				String front = "2Weeks_";
				String reName = front + sdf.format(System.currentTimeMillis()) + "_" + rndNum + ext;

				try {
					f.transferTo(new File(path + reName));

					k.getAttachments().add(KinAttachment.builder().atch_Ori(oriFilename).atch_New(reName).build());

				} catch (IOException e) {
					e.printStackTrace();
				}

			} // for문 종료
		} // if문 종료
		String msg = "등록 성공";
		try {
			service.insertKin(k);
		} catch (Exception e) {
			msg = e.getMessage();
		}

		mv.addObject("msg", msg);
		mv.addObject("loc", "/KnowledgeIn/KnowledgeInMain.do");
		mv.setViewName("common/msg");

		return mv;
	}

	@RequestMapping("/KnowledgeIn/KnowledgeInMyList.do") // 나의 질문,답변
	public String KnowledgeInMyList() {
		return "KnowledgeIn/KnowledgeInMyList";
	}

	
	
	@RequestMapping("/KnowledgeIn/KnowledgeInAEnd.do") // 지식인 답변등록
	public ModelAndView insertKinReply(KinReply kr, MultipartFile[] upload, ModelAndView mv,
			HttpServletResponse response, HttpServletRequest req) throws IOException {

		logger.debug("knowledgIn : " + kr);
		for (int i = 0; i < upload.length; i++) {
			logger.debug("fileName : " + upload[i].getOriginalFilename());
			logger.debug("fileName : " + upload[i].getSize());
		}

		String path = req.getServletContext().getRealPath("/resources/upload");
		File dir = new File(path); // 폴더
		if (!dir.exists()) {
			dir.mkdirs();
		}

		for (MultipartFile f : upload) {

			if (!f.isEmpty()) {
				String oriFilename = f.getOriginalFilename();
				String ext = oriFilename.substring(oriFilename.lastIndexOf("."));

				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndNum = (int) (Math.random() * 10000);
				String reName = sdf.format(System.currentTimeMillis()) + "_" + rndNum + ext;

				try {
					f.transferTo(new File(path + reName));

					kr.getAttachments()
							.add(KinReplyAttachment.builder().atch_Ori(oriFilename).atch_New(reName).build());

				} catch (IOException e) {
					e.printStackTrace();
				}

			} // for문 종료
		} // if문 종료
		String msg = "등록 성공";
		try {
			service.insertKinReply(kr);
		} catch (Exception e) {
			msg = e.getMessage();
		}

		mv.addObject("msg", msg);
		mv.addObject("loc", "/KnowledgeIn/KnowledgeInList.do");
		mv.setViewName("common/msg");

		return mv;
	}

	/*
	 * //게시물 수정페이지로 이동 (수정뷰)
	 * 
	 * @RequestMapping(value="/KnowledgeIn/update",method=RequestMethod.GET)
	 * 
	 * 
	 * public ModelAndView getupdate (ModelAndView mv,int sq) throws Exception{
	 * mv.addObject("KnowledgeIn",service.selectKinOne(sq));
	 * 
	 * mv.setViewName("KnowledgeIn/update"); return mv;
	 * 
	 * 
	 * 
	 * }
	 * 
	 * 
	 * //게시물 수정
	 * 
	 * @RequestMapping(value="/KnowledgeIn/update_action",method=RequestMethod.POST)
	 * 
	 * public String update (@ModelAttribute("k") Kin k,HttpServletRequest
	 * request,RedirectAttributes redirect, Model model) throws Exception{
	 * logger.info("update"); try { service.update(k);
	 * redirect.addFlashAttribute("redirect",k.getKin_Sq());
	 * 
	 * 
	 * 
	 * redirect.addFlashAttribute("msg","수정이 완료되었습니다.");
	 * 
	 * }catch(Exception e) { redirect.addFlashAttribute("msg","오류가 발생되었습니다."); }
	 * return "redirect:/KnowledgeIn/KnowledgeInMain.do"; return
	 * "redirect:/KnowledgeIn/KnowledgeInList.do?sq="+k.getKin_Sq(); }
	 */

	@RequestMapping("/KnowledgeIn/update")
	public ModelAndView update(ModelAndView mv, Kin k, @RequestParam("article_file") MultipartFile[] upload,
			HttpServletRequest request, MultipartFile[] file) {
		
		
		
		log.info("update 수정?");

		for (int i = 0; i < file.length; i++) {
			log.info("================== file start ==================");
			log.info("파일 이름: " + file[i].getName());
			log.info("파일 실제 이름: " + file[i].getOriginalFilename());
			log.info("파일 크기: " + file[i].getSize());
			log.info("content type: " + file[i].getContentType());
			log.info("================== file   END ==================");

		}

		String path = request.getServletContext().getRealPath("/resources/upload/knowledgeIn"); // resources/upload 경로
																								// 설정하여 path에 저장
		File dir = new File(path); // 폴더
		String reName = "";
		if (!dir.exists()) {
			dir.mkdirs();
		}

		for (MultipartFile f : file) {
			// 파일 있니
			if (!f.isEmpty()) {
				String oriFileName = f.getOriginalFilename();
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndNum = (int) Math.random() * 10000000;
				String front = "2Weeks_";
				reName = front + sdf.format(System.currentTimeMillis()) + "_" + rndNum + ext;
				try {
					f.transferTo(new File(path + reName));
					List<KinAttachment> list = k.getAttachments();
					list.add(KinAttachment.builder().atch_Ori(oriFileName).atch_New(reName).build());
				
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		String msg = "수정 성공";
		try {
			log.info("================== update start ==================");
			service.update(k);
			
		} catch (Exception e) {
			// FileUtils.deleteQuietly(new File(path+reName)); //저장된 현재 파일 삭제
			msg = e.getMessage();
		}
		/* mv.addObject("no", request.getParameter("post_Sq")); */
		mv.addObject("sq", request.getParameter("sq"));
		log.info("list" + k.getAttachments());//???
		mv.addObject("msg", msg);
		mv.addObject("loc", "/KnowledgeIn/KnowledgeInMain.do"); // common/msg에 넣어버리면 location.replace라서 작동안됨.
		

	
		// redirect로 수정한 게시물을 보여준다.
		mv.setViewName("common/msg");
		return mv;
	}

	
	//작성화면으로 이동
	@RequestMapping("/KnowledgeIn/update.do")
	public String updateEnd(Kin k, Model model,  HttpServletRequest request) throws Exception {
		
		log.info("updateEnd");
		
		int sq = Integer.parseInt(request.getParameter("sq"));
		System.out.println(sq+"번호가 맞는지 확인");
		k.setKin_Sq(Integer.parseInt(request.getParameter("sq")));
		model.addAttribute("knowledgeIn", service.selectKinOne(k.getKin_Sq()));
	
	/*		model.addAttribute("list", service.read(fb.getPost_Sq()));*/
		return "/KnowledgeIn/update";
	
		
	}
	
	
}
