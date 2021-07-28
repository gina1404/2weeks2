package com.twoweeks.spring.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.twoweeks.spring.member.model.service.MemberService;
import com.twoweeks.spring.member.model.vo.Member;
import com.twoweeks.spring.member.model.vo.SignUp;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	//회원가입 페이지 이동
	@GetMapping("/signup")
	public String SignUp(Model model) {
		model.addAttribute("member",new Member());
		return "/member/signup";
	}
	
	//아이디중복체크
	@GetMapping("/member/idCheck")
	@ResponseBody
	public int idCheck(
			@RequestParam("user_Id")String userId) {
		
		return memberService.idCheck(userId);
	}
	
	//이메일인증
	@GetMapping("/member/mailCheck")
	@ResponseBody
	public String mailCheck(
			@RequestParam("email")String email)throws Exception {
		log.info("이메일 넘어왔나요?= {}",email);
		
		//랜덤값(인증번호) 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호 생성 = {}",checkNum);
		
		//이메일 보내기 
		String setFrom = "tweeks.official.mail@gmail.com";
		String toMail = email; 
		String title = "2WEEKS 회원가입 인증 메일입니다.";
		String content = "2WEEKS 회원가입을 환영합니다 !"+
							"<br><br>"+
							"인증번호는 "+"<u>"+checkNum+ "</u>"+"입니다"+
							"<br><br>"+
							"인증번호를 확인란에 기입해주세요";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);			
		}catch(Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);
		
		return num;
	
	}
	//회원가입
	@PostMapping("/signup")
	public String insertMember(
					@RequestParam MultipartFile[] upFile,			
					@Validated @ModelAttribute("member") SignUp signup, BindingResult bindingResult, 
					Model model,
					
					HttpServletRequest request) {
		if(bindingResult.hasErrors()) {
			log.info("가입실패 ={} ", bindingResult);
			
			return "/member/signup";
		}
		String path=request.getServletContext().getRealPath("/resources/upload/member/profile");
		File dir= new File(path);
		
		if(!dir.exists()) dir.mkdir();
		
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				String originalFilename = f.getOriginalFilename();
				log.info("originalFilename={}",f.getOriginalFilename());
				String ext=originalFilename.substring(originalFilename.lastIndexOf("."));
			
				SimpleDateFormat sdformat = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int ranNum=(int)(Math.random()*10000);
				String reName = sdformat.format(System.currentTimeMillis())+"_"+ranNum+ ext;
				log.info("rename={}",reName);
				
				try {
					f.transferTo(new File(path+reName));
					log.info("transferto 이후 originalFilename={}",f.getOriginalFilename());
					log.info("transferto 이후 rename={}",reName);
					signup.setUser_Pf(originalFilename);
					signup.setUser_pfrename(reName);
				}catch(IOException e) {
					log.info("IOexception ??????????");
					e.printStackTrace();
				}
			}
			}
		
		log.info("파일오리지널네임 ={}",signup.getUser_Pf());
		log.info("파일리네임={}",signup.getUser_pfrename());
		
		
		Member member = new Member();
		member.setUser_Pw(pwEncoder.encode(signup.getUser_Pw()));
		log.info("암호화 확인 = {}",member.getUser_Pw());
		
		member.setUser_Id(signup.getUser_Id());
		//member.setUser_Pw(signup.getUser_Pw());
		member.setUser_Nm(signup.getUser_Nm());
		member.setUser_Nic(signup.getUser_Nic());
		member.setUser_Gender(signup.getUser_Gender());
		member.setUser_Phone(signup.getUser_Phone());
		member.setUser_Pf(signup.getUser_Pf());
		member.setUser_pfrename(signup.getUser_pfrename());
		member.setUser_Email(signup.getUser_Email());
		System.out.println(member);
		
		int result = memberService.insertMember(member);
		String msg ="";
		String loc="";
		
		if(result>0) {
			msg="회원가입 성공";
			loc="/";
		}else {
			msg="회원가입실패";
			loc="/signup";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		//model.addAttribute("member", new Member());

			return "/member/login";
	}

}
