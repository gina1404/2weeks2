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
import org.springframework.web.servlet.ModelAndView;

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
	
	//???????????????(????????????)
	@GetMapping("/member/testmain")
	public String testmain() {
		return "/member/testmain";
	}
	
	//???????????? ????????? ??????
	@GetMapping("/signup")
	public String signUp(Model model) {
		model.addAttribute("member",new Member());
		return "/member/signup";
	}
	//????????? ????????? ??????
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
	//??????????????????
	@RequestMapping("/member/kakaoLogin")
	public String kakaoLogin(
			@RequestParam("code") String code,HttpSession session) {
		log.info("code???????????????? ={} ",code);
		
		String access_Token = kakao.getAccessToken(code);		
		log.info("???????????? access_Token ={}",access_Token);
		//???????????? Map ?????? 
		HashMap<String,Object> userInfo = kakao.getUserInfo(access_Token);
		log.info("login Controller ???????????? ={}",userInfo);
			
		//???????????? ???????????? DB ??????
		if(userInfo.get("email") != null) {
			
			
			String sns_Id= (String) userInfo.get("id");
			String user_Nic= (String) userInfo.get("nickname");
			String user_Nm= (String) userInfo.get("nickname");
			String user_Email = (String) userInfo.get("email");			
			log.info("sns_Id ={}, user_Nic={},user_Nm ={}, user_Email={}",sns_Id,user_Nic,user_Nm,user_Email);
			
			String dbUserId = memberService.selectKakaoId(sns_Id);
			
			if(dbUserId ==null) {
			log.info("db??? ???????????????");
			//db??????
			Member member = new Member();
			member.setUser_Id(sns_Id);
			member.setSns_Id(sns_Id);
			member.setUser_Nm(user_Nm);
			member.setUser_Nic(user_Nic);
			member.setUser_Email(user_Email);
					
			int result = memberService.insertKakao(member);
			}
		}
			//????????????	
			session.setAttribute("userId", userInfo.get("email"));
			session.setAttribute("user_Nic", userInfo.get("nickname"));
			session.setAttribute("access_Token", access_Token);
			
			
			return "/index";
	}
	//????????? ????????????
	@RequestMapping("/member/kakaologout")
	public String kakaologout(HttpSession session) {
		kakao.kakaoLogout((String)session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("userId");
		return "/index";
	}
			
	
	
	//?????????????????????
	@GetMapping("/member/idCheck")
	@ResponseBody
	public String idCheck(
			@RequestParam("user_Id")String userId) {
		int result = memberService.idCheck(userId);
		//log.info("result= {}",result);
		String num = Integer.toString(result);
			
		return num;
	
	}
	//?????????????????????
	@GetMapping("/member/nicCheck")
	@ResponseBody
	public String nicCheck(
			@RequestParam("user_Nic")String userNic) {
		int result = memberService.nicCheck(userNic);
		//log.info("result= {}",result);
		String num = Integer.toString(result);
			
		return num;
	
	}
	
	//???????????????
	@GetMapping("/member/mailCheck")
	@ResponseBody
	public String mailCheck(
			@RequestParam("email")String email)throws Exception {
		log.info("????????? ????????????????= {}",email);
		
		//?????????(????????????) ??????
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("???????????? ?????? = {}",checkNum);
		
		//????????? ????????? 
		String setFrom = "tweeks.official.mail@gmail.com";
		String toMail = email; 
		String title = "2WEEKS ???????????? ?????? ???????????????.";
		String content = "2WEEKS ??????????????? ??????????????? !"+
							"<br><br>"+
							"??????????????? "+"<u>"+checkNum+ "</u>"+"?????????"+
							"<br><br>"+
							"??????????????? ???????????? ??????????????????";
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
	//????????????
	@PostMapping("/signup")
	public String insertMember(
					@RequestParam MultipartFile[] upFile,			
					@Validated @ModelAttribute("member") SignUp signup, BindingResult bindingResult, 
					Model model,
					
					HttpServletRequest request) {
		if(bindingResult.hasErrors()) {
			log.info("???????????? ={} ", bindingResult);
			
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
					log.info("transferto ?????? originalFilename={}",f.getOriginalFilename());
					log.info("transferto ?????? rename={}",reName);
					signup.setUser_Pf(originalFilename);
					signup.setUser_Pfrename(reName);
				}catch(IOException e) {
					log.info("IOexception ??????????");
					e.printStackTrace();
				}
			}
			}
		
		log.info("???????????????????????? ={}",signup.getUser_Pf());
		log.info("???????????????={}",signup.getUser_Pfrename());
		
		
		Member member = new Member();
		member.setUser_Pw(pwEncoder.encode(signup.getUser_Pw()));
		log.info("????????? ?????? = {}",member.getUser_Pw());
		
		member.setUser_Id(signup.getUser_Id());
		//member.setUser_Pw(signup.getUser_Pw());
		member.setUser_Nm(signup.getUser_Nm());
		member.setUser_Nic(signup.getUser_Nic());
		//member.setUser_Gender(signup.getUser_Gender());
		member.setUser_Phone(signup.getUser_Phone());
		member.setUser_Pf(signup.getUser_Pf());
		member.setUser_Pfrename(signup.getUser_Pfrename());
		member.setUser_Email(signup.getUser_Email());
		System.out.println(member);
		
		int result = memberService.insertMember(member);
		String msg ="";
		String loc="";
		
		if(result>0) {
			msg="2WEEKS ???????????? ?????? ????";
			loc="/member/login";
		}else {
			msg="??????????????????";
			loc="/signup";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		//model.addAttribute("member", new Member());

			return "/common/msg";
	}
	
	
	///?????????
	@PostMapping("/member/login")
	public String memberLogin(
			@Validated Login login, BindingResult bindingResult,
			@RequestParam Map param , Model model, HttpSession session,HttpServletResponse response) {
		if(bindingResult.hasErrors()) {
			return "/member/login";
		}
		log.info("login ????????? ={}",login.getUser_Id());
		log.info("map ?????????={} ",(String)param.get("user_Id"));
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
//		log.info("param.get(user_Pw) ={}",param.get("user_Pw"));
//		log.info("m ????????? ={} " , m.getUser_Id());
//		log.info("m.getUser_Pw() ={}", m.getUser_Pw());
		
		if(m!=null) {			
			if(pwEncoder.matches((String)param.get("user_Pw"), m.getUser_Pw())) {
			session.setAttribute("member", m);
			
			session.setAttribute("chatId", m.getUser_Id());
			session.setAttribute("chatName", m.getUser_Nic());
			
			model.addAttribute("loginMember",m);
			msg="???????????????";
			}else {
			msg="????????? ??????. ????????? ??? ??????????????? ??????????????????!";
			}
		}else {
			msg="????????? ??????. ????????? ??? ??????????????? ??????????????????!";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc","/");
				
		return "common/msg";
		
	}
	
	//????????????
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	//id/pw?????? ?????????
	@GetMapping("/member/findid")
	public String findMember() {
		return "/member/findid";
	}
	
	//id??????
	@PostMapping("/member/findid")
	@ResponseBody
	public String findId(
			@RequestParam String user_Nm,
			@RequestParam String user_Email) {
		
		log.info("???????????? ?????? ={} {}",user_Nm,user_Email);
		Member member = new Member();
		member.setUser_Nm(user_Nm);
		member.setUser_Email(user_Email);
		String user_Id = memberService.findId(member);
		//model.addAttribute("user_Id", memberService.findId(member));
		log.info(user_Id);
		return user_Id;
		
	}
	//pw??????
	@PostMapping(value="/member/findpw", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String findPw(
			@RequestBody Member member) {
		log.info("????????? ??????={}",member.getUser_Id());
		log.info("???????????????={}",member.getUser_Email());
		
		//?????????????????? ??????
		String newPw =generatePw();
		log.info("?????????????????? ?????? = {}",newPw);
		member.setUser_Pw(pwEncoder.encode(newPw));
		log.info("?????????????????? ?????????={}",member.getUser_Pw());
		
		int result=memberService.updatePw(member);
		log.info("result={}",result);
		
		if(result>=1) {
			//???????????? ????????? ?????????????????? ???????????? ?????????
			String setFrom= "tweeks.official.mail@gmail.com";
			String toMail = member.getUser_Email();
			String title = "2WEEKS ?????? ?????????????????????";
			String content =member.getUser_Id()+"?????? ?????? ???????????? ?????????." +
							"<br/><br/>"+
							"?????? ??????????????? " + "<strong>"+newPw +"</strong>"+"?????????"+
							"<br/><br/>"+
							"????????? ??? ??????????????? ???????????????!";
			log.info("??????????????????");
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content,true);
				mailSender.send(message);
				//log.info(message.toString());
				log.info("????????????");
			}catch(Exception e) {
				e.printStackTrace();
			}
			return "????????????????????? ?????????????????????";
			
		}else {
			log.info("??????????????????");
			return "???????????? ??????????????? ????????????";
		}	
		
	}
	//???????????? ?????? ???????????????
	@GetMapping("/member/myinfo")
	public String myinfo() {
		return "/member/myinfo";
	}
	
	//??????????????????
	@PostMapping("/member/myinfo")
	public String updateInfo(
			@RequestParam MultipartFile[] upFile,
			@ModelAttribute("member") UpdateMember updateMember, BindingResult bindingResult,
			Model model,HttpServletRequest request,HttpSession session) {
		log.info("????????????={}",upFile);
		if(bindingResult.hasErrors()) {
			log.info("???????????? ={} ", bindingResult);		
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
			log.info("??????????????????");
			msg="???????????? ????????? ?????????????????????.";
			session.setAttribute("member", member);
		}else {
			msg="?????? ??????";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "/common/msg";
		
		}
	
	//???????????? ?????? ?????????
	@GetMapping("/member/findPw")
	public String updatePw(Model model) {
		model.addAttribute("member",new Member());
		return "/member/updatePw";
	}
	
	//??????????????????
	@PostMapping("/member/findPw")
	public String updatePw(
			@Validated @ModelAttribute("member") UpdateMember updateMember, BindingResult bindingResult,
			Model model,HttpSession session) {
		log.info("??????={},???={}",updateMember.getOldPw(),updateMember.getUser_Pw());
		
		
		if(pwEncoder.matches(updateMember.getOldPw(),memberService.selectPw(updateMember.getUser_Id()))) {
			Member member = new Member();
			member.setUser_Pw(pwEncoder.encode(updateMember.getUser_Pw()));
			log.info("???????????? ??????={}",member.getUser_Pw());
			member.setUser_Id(updateMember.getUser_Id());
			member.setUser_Email(updateMember.getUser_Email());
			int result = memberService.updatePw(member);
			String msg="";
			String loc="/member/updatePw";
			if(result>0) {
				msg="??????????????? ?????????????????????!";
				
				session.setAttribute("member", member);
			}else {
				msg="?????? ??????";
			}
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);	
		}
			return "/common/msg";
	}
	
	
	//?????????????????? ???????????????(UUID)
	public String generatePw() {
		String uuid = UUID.randomUUID().toString().replaceAll("-","");
		uuid = uuid.substring(0,10); //10?????? ??????
		log.info("uuid={}",uuid);		
		return uuid;
	}
	
}
