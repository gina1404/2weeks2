package com.twoweeks.spring.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.admin.model.service.AdminService;
import com.twoweeks.spring.admin.model.vo.Notice;
import com.twoweeks.spring.admin.model.vo.Point;
import com.twoweeks.spring.admin.model.vo.Report;
import com.twoweeks.spring.admin.model.vo.noticeAttachment;
import com.twoweeks.spring.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	@Autowired
	private AdminService service;

	@RequestMapping("/admin/adminPageList")
	public ModelAndView adminPage(ModelAndView mv) {

		List<Member> list = service.selectMemberList();
		int memberct = service.selectMembercount();
		// System.out.println(list);

		mv.addObject("memberct", memberct);
		mv.addObject("list", list);
		mv.setViewName("admin/adminMainPage");
		return mv;
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
	public ModelAndView insertNotice(Notice n, ModelAndView mv, MultipartFile[] upFile, HttpServletRequest req) {
		String path = req.getServletContext().getRealPath("/resources/upload/notice/");
		File dir = new File(path);

		if (!dir.exists())
			dir.mkdirs();

		for (MultipartFile f : upFile) {
			if (!f.isEmpty()) {
				String oriFilename = f.getOriginalFilename();
				String ext = oriFilename.substring(oriFilename.lastIndexOf("."));

				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndNum = (int) Math.random() * 10000;
				String reName = sdf.format(System.currentTimeMillis()) + "_" + rndNum + ext;

				try {
					f.transferTo(new File(path + reName));
					List<noticeAttachment> list = n.getAttachments();
					list.add(noticeAttachment.builder().originalFilename(oriFilename).renamedFilename(reName).build());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		int result = service.insertNotice(n);
		mv.addObject("msg", result > 0 ? "입력성공" : "입력실패");
		mv.addObject("loc", "/admon/NoticeWriter.do");
		mv.setViewName("common/msg");

		return mv;
	}

	@RequestMapping("/admin/deleteMember")
	public ModelAndView deleteMember(HttpServletRequest req, ModelAndView mv) {
		String userId = req.getParameter("userId");
		int result = service.deleteMember(userId);

		mv.addObject("msg", result > 0 ? "삭제되었습니다" : "삭제에 실패하였습니다");
		mv.addObject("loc", "/admin/adminPageList");
		mv.setViewName("common/msg");

		return mv;
	}

	@RequestMapping("/admin/reportList.do")
	public ModelAndView reportList(ModelAndView mv, HttpServletRequest req) {
		String userId = req.getParameter("userId");
		/*
		 * List<Report> list=service.reportList(userId);
		 * 
		 * mv.addObject("list", list);
		 */
		mv.setViewName("admin/reportTable");
		return mv;
	}

	@RequestMapping("/admin/updataPoint.do")
	public ModelAndView updataPoint(ModelAndView mv, HttpServletRequest req) {
		String userId = req.getParameter("userId");

		mv.addObject("userId", userId);
		mv.setViewName("admin/pointUpdate");
		return mv;
	}

	@RequestMapping("/admin/updatePointEnd.do")
	public ModelAndView updatePointEnd(ModelAndView mv, HttpServletRequest req) {
		Point re = new Point();
		re.setUserId(req.getParameter("userId"));
		re.setPointAmt(Integer.parseInt(req.getParameter("pointAmt")));
		re.setPointGb(req.getParameter("pointGb"));
		re.setPointDiscription(req.getParameter("pointDiscription"));

		int result = service.insertPointEnd(re);
		System.out.println(re);

		
		 String userId=re.getUserId(); 
		 


		if(result>0) {
			int updatePoint=service.updatePointEnd(re);
			if(updatePoint>0) {

				mv.addObject("msg", "변경되었습니다.");
				mv.addObject("loc", "/admin/updataPoint.do?userId="+userId);
				mv.setViewName("common/msg");
				
			}else {
				mv.addObject("msg", "변경에 실패하였습니다.");
				mv.addObject("loc", "/admin/updataPoint.do?userId="+userId);
				mv.setViewName("common/msg");
			}
		}
		


		return mv;
	}
	@RequestMapping("/admin/adminReporttable.do")
	public ModelAndView adminReporttable(ModelAndView mv) {
		
		List<Report>list=service.adminReporttable();
		System.out.println(list);
		mv.addObject("list", list);
		mv.setViewName("admin/adminReportTable");
		return mv;
	}
}
