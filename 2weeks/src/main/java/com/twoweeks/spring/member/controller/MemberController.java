package com.twoweeks.spring.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.twoweeks.spring.member.model.service.KakaoApi;
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
	
	@Autowired
	private KakaoApi kakao;
	
	//메인테스트(삭제에정)
	@GetMapping("/member/testmain")
	public String testmain() {
		return "/member/testmain";
	}
	
	//회원가입 페이지 이동
	@GetMapping("/signup")
	public String signUp(Model model) {
		model.addAttribute("member",new Member());
		return "/member/signup";
	}
	//로그인 페이지 이동
	@GetMapping("/member/login")
	public String login() {
		return "/member/login";
	}
	//카카오로그인
	@RequestMapping("/kakaoLogin")
	public String kakaoLogin(
			@RequestParam("code") String code,HttpSession session) {
		log.info("code넘어왔나요? ={} ",code);
		
		String access_Token = kakao.getAccessToken(code);
		
		log.info("컨트롤러 access_Token ={}",access_Token);
		
		HashMap<String,Object> userInfo = kakao.getUserInfo(access_Token);
		log.info("login Controller 유저정보 ={}",userInfo);
		
		//이메일이 존재할때 세선에 등록
		if(userInfo.get("email") != null) {
			session.setAttribute("userId", userInfo.get("email"));
			session.setAttribute("access_Token", access_Token);
		}
		return "/member/testmain";
	}
	//카카오 로그아웃
	@RequestMapping("/kakaologout")
	public String logout(HttpSession session) {
		kakao.kakaoLogout((String)session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("userId");
		return "/member/testmain";
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
		
		if(!dir.exists()) dir.mkdirs();
		
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
					signup.setUser_Pfrename(reName);
				}catch(IOException e) {
					log.info("IOexception ??????????");
					e.printStackTrace();
				}
			}
			}
		
		log.info("파일오리지널네임 ={}",signup.getUser_Pf());
		log.info("파일리네임={}",signup.getUser_Pfrename());
		
		
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
		member.setUser_Pfrename(signup.getUser_Pfrename());
		member.setUser_Email(signup.getUser_Email());
		System.out.println(member);
		
		int result = memberService.insertMember(member);
		String msg ="";
		String loc="";
		
		if(result>0) {
			msg="2WEEKS 회원가입 성공 😃";
			loc="/member/login";
		}else {
			msg="회원가입실패";
			loc="/signup";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		//model.addAttribute("member", new Member());

			return "/common/msg";
	}
	
	@PostMapping("/member/login")
	public String memberLogin(
			@RequestParam Map param , Model model, HttpSession session) {
		
		Member m = memberService.selectMember(param);
		
		String msg;
		log.info("param.get(user_Pw) ={}",param.get("user_Pw"));
		log.info("m 아이디 ={} " , m.getUser_Id());
		log.info("m.getUser_Pw() ={}", m.getUser_Pw());
		
		if(m!=null) {			
			if(pwEncoder.matches((String)param.get("user_Pw"), m.getUser_Pw())) {
			model.addAttribute("loginMember",m);
			msg="로그인성공";
			}else {
			msg="로그인실패";
			}
		}else {
			msg="로그인실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc","/member/testmain");
		
		return "common/msg";
		
	}
	
	

}
