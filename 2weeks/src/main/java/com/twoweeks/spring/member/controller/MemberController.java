package com.twoweeks.spring.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.twoweeks.spring.member.model.service.KakaoApi;
import com.twoweeks.spring.member.model.service.MemberService;
import com.twoweeks.spring.member.model.vo.Login;
import com.twoweeks.spring.member.model.vo.Member;
import com.twoweeks.spring.member.model.vo.SignUp;
import com.twoweeks.spring.member.model.vo.UpdateMember;

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
	public String login(
			Model model,
			Login login,
			@CookieValue(value = "REMEMBER", required = false) Cookie rememberCookie) {
		if(rememberCookie!=null) {
			login.setUser_Id(rememberCookie.getValue());
			login.setRememberId(true);
		}
		model.addAttribute("login",login);
		
		return "/member/login";
	}
	//카카오로그인
	@RequestMapping("/member/kakaoLogin")
	public String kakaoLogin(
			@RequestParam("code") String code,HttpSession session) {
		log.info("code넘어왔나요? ={} ",code);
		
		String access_Token = kakao.getAccessToken(code);		
		log.info("컨트롤러 access_Token ={}",access_Token);
		//유저정보 Map 저장 
		HashMap<String,Object> userInfo = kakao.getUserInfo(access_Token);
		log.info("login Controller 유저정보 ={}",userInfo);
			
		//이메일이 존재할때 DB 등록
		if(userInfo.get("email") != null) {
			
			
			String sns_Id= (String) userInfo.get("id");
			String user_Nic= (String) userInfo.get("nickname");
			String user_Nm= (String) userInfo.get("nickname");
			String user_Email = (String) userInfo.get("email");			
			log.info("sns_Id ={}, user_Nic={},user_Nm ={}, user_Email={}",sns_Id,user_Nic,user_Nm,user_Email);
			
			String dbUserId = memberService.selectKakaoId(sns_Id);
			
			if(dbUserId ==null) {
			log.info("db에 데이터없음");
			//db등록
			Member member = new Member();
			member.setUser_Id(sns_Id);
			member.setSns_Id(sns_Id);
			member.setUser_Nm(user_Nm);
			member.setUser_Nic(user_Nic);
			member.setUser_Email(user_Email);
					
			int result = memberService.insertKakao(member);
			}
		}
			//세션등록	
			session.setAttribute("userId", userInfo.get("email"));
			session.setAttribute("access_Token", access_Token);
			
			
			return "/index";
	}
	//카카오 로그아웃
	@RequestMapping("/member/kakaologout")
	public String kakaologout(HttpSession session) {
		kakao.kakaoLogout((String)session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("userId");
		return "/index";
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
	
	
	///로그인
	@PostMapping("/member/login")
	public String memberLogin(
			@Validated Login login, BindingResult bindingResult,
			@RequestParam Map param , Model model, HttpSession session,HttpServletResponse response) {
		if(bindingResult.hasErrors()) {
			return "/member/login";
		}
		log.info("login 아이디 ={}",login.getUser_Id());
		log.info("map 아이디={} ",(String)param.get("user_Id"));
		Member m = memberService.selectMember(param);
		
		//MemberSession memberSession = new MemberSession();
		//memberSession.setUser_Id(m.getUser_Id());
		//memberSession.setUser_Nm(m.getUser_Nm());
		//memberSession.setUser_Pfrename(m.getUser_Pfrename());
		
		
		Cookie rememberCookie = new Cookie("REMEMBER",login.getUser_Id());
		rememberCookie.setPath("/");
		if(login.isRememberId()) {
			rememberCookie.setMaxAge(60*60*24*7);
		}else {
			rememberCookie.setMaxAge(0);
		}
			response.addCookie(rememberCookie);
			
		String msg;
		log.info("param.get(user_Pw) ={}",param.get("user_Pw"));
		log.info("m 아이디 ={} " , m.getUser_Id());
		log.info("m.getUser_Pw() ={}", m.getUser_Pw());
		
		if(m!=null) {			
			if(pwEncoder.matches((String)param.get("user_Pw"), m.getUser_Pw())) {
			session.setAttribute("member", m);
			model.addAttribute("loginMember",m);
			msg="로그인성공";
			}else {
			msg="로그인 실패. 아이디 및 패스워드를 확인해주세요!";
			}
		}else {
			msg="로그인 실패. 아이디 및 패스워드를 확인해주세요!";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc","/");
		
		return "common/msg";
		
	}
	
	//로그아웃
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	//id/pw찾기 페이지
	@GetMapping("/member/findid")
	public String findMember() {
		return "/member/findid";
	}
	
	//id찾기
	@PostMapping("/member/findid")
	@ResponseBody
	public String findId(
			@RequestParam String user_Nm,
			@RequestParam String user_Email) {
		
		log.info("파라미터 확인 ={} {}",user_Nm,user_Email);
		Member member = new Member();
		member.setUser_Nm(user_Nm);
		member.setUser_Email(user_Email);
		String user_Id = memberService.findId(member);
		//model.addAttribute("user_Id", memberService.findId(member));
		log.info(user_Id);
		return user_Id;
		
	}
	//pw찾기
	@PostMapping(value="/member/findpw", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String findPw(
			@RequestBody Member member) {
		log.info("아이디 확인={}",member.getUser_Id());
		log.info("이메일확인={}",member.getUser_Email());
		
		//임시비밀번호 생성
		String newPw =generatePw();
		log.info("임시비밀번호 생성 = {}",newPw);
		member.setUser_Pw(pwEncoder.encode(newPw));
		log.info("임시비밀번호 암호화={}",member.getUser_Pw());
		
		int result=memberService.updatePw(member);
		log.info("result={}",result);
		
		if(result>=1) {
			//업데이트 됬으면 임시비밀번호 이메일로 보내기
			String setFrom= "tweeks.official.mail@gmail.com";
			String toMail = member.getUser_Email();
			String title = "2WEEKS 임시 비밀번호입니다";
			String content =member.getUser_Id()+"님의 임시 비밀번호 입니다." +
							"<br/><br/>"+
							"임시 비밀번호는 " + "<strong>"+newPw +"</strong>"+"입니다"+
							"<br/><br/>"+
							"로그인 후 비밀번호를 변경하세요!";
			log.info("업데이트성공");
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content,true);
				mailSender.send(message);
				log.info("발송성공");
			}catch(Exception e) {
				e.printStackTrace();
			}
			return "임시비밀번호가 발송되었습니다";
			
		}else {
			log.info("업데이트실패");
			return "일치하는 회원정보가 없습니다";
		}	
		
	}
	//회원정보 수정 페이지이동
	@GetMapping("/member/myinfo")
	public String myinfo() {
		return "/member/myinfo";
	}
	
	//회원정보수정
	@PostMapping("/member/myinfo")
	public String updateInfo(
			@RequestParam MultipartFile[] upFile,
			@ModelAttribute("member") UpdateMember updateMember, BindingResult bindingResult,
			Model model,HttpServletRequest request,HttpSession session) {
		log.info("파일네임={}",upFile);
		if(bindingResult.hasErrors()) {
			log.info("수정실패 ={} ", bindingResult);		
			return "/member/myinfo";	
	}
		String path=request.getServletContext().getRealPath("/resources/upload/member/profile");
		File dir= new File(path);
		if(!dir.exists()) dir.mkdirs();
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				String originalFilename = f.getOriginalFilename();
				String ext=originalFilename.substring(originalFilename.lastIndexOf("."));
			
				SimpleDateFormat sdformat = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int ranNum=(int)(Math.random()*10000);
				String reName = sdformat.format(System.currentTimeMillis())+"_"+ranNum+ ext;
				
				try {
					f.transferTo(new File(path+reName));
					updateMember.setUser_Pf(originalFilename);
					updateMember.setUser_Pfrename(reName);
				}catch(IOException e) {
					e.printStackTrace();
					}
				}			
			}
		Member member= new Member();
		member.setUser_Id(updateMember.getUser_Id());
		member.setUser_Nic(updateMember.getUser_Nic());
		member.setUser_Phone(updateMember.getUser_Phone());
		member.setUser_Pf(updateMember.getUser_Pf());
		member.setUser_Pfrename(updateMember.getUser_Pfrename());
		
		int result = memberService.UpdateMember(member);
		String msg="";
		String loc="/member/myinfo";
		if(result>0) {
			log.info("업데이트성공");
			msg="회원님의 정보가 수정되었습니다.";
			session.setAttribute("member", member);
		}else {
			msg="수정 실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "/common/msg";
		
		}
	
	//비밀번호 변경 페이지
	@GetMapping("/member/updatePw")
	public String updatePw(Model model) {
		model.addAttribute("member",new Member());
		return "/member/updatePw";
	}
	
	//비밀번호변경
	@PostMapping("/member/findPw")
	public String updatePw(
			@ModelAttribute("member") UpdateMember updateMember, BindingResult bindingResult,
			Model model,HttpSession session) {
		log.info("기존={},뉴={}",updateMember.getOldPw(),updateMember.getUser_Pw());
		
		
		if(pwEncoder.matches(updateMember.getOldPw(),memberService.selectPw(updateMember.getUser_Id()))) {
			Member member = new Member();
			member.setUser_Pw(pwEncoder.encode(updateMember.getUser_Pw()));
			log.info("비번변경 확인={}",member.getUser_Pw());
			member.setUser_Id(updateMember.getUser_Id());
			member.setUser_Email(updateMember.getUser_Email());
			int result = memberService.updatePw(member);
			String msg="";
			String loc="/member/updatePw";
			if(result>0) {
				msg="비밀번호가 변경되었습니다!";
				
				session.setAttribute("member", member);
			}else {
				msg="변경 실패";
			}
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);	
		}
			return "/common/msg";
	}
	
	
	//임시비밀번호 생성메소드(UUID)
	public String generatePw() {
		String uuid = UUID.randomUUID().toString().replaceAll("-","");
		uuid = uuid.substring(0,10); //10자리 생성
		log.info("uuid={}",uuid);		
		return uuid;
	}
	
	
	

}
