package com.twoweeks.spring.member.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.twoweeks.spring.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("/signup")
	public String SignUp() {
		return "/member/signup";
	}
	
	//아이디중복체크
	@GetMapping("/member/idCheck")
	@ResponseBody
	public int idCheck(
			@RequestParam("userId")String userId) {
		
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
	
	

}
