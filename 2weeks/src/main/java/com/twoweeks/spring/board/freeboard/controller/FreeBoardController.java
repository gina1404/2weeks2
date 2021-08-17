package com.twoweeks.spring.board.freeboard.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.board.freeboard.model.service.FreeBoardService;
import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.board.freeboard.model.vo.PostAttachment;
import com.twoweeks.spring.board.freeboard.reply.model.service.ReplyService;
import com.twoweeks.spring.common.PageFactory;

import lombok.extern.slf4j.Slf4j;

@RestController  //restController는 값들을 다 data로 인식하여 처리한다. 그렇기 때문에 return에 주소값을 넣어주면 주소이동하지 않고 데이터를 출력해준다.
@Slf4j
public class FreeBoardController {

	@Autowired
	private ReplyService rService;
	
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
		
		
		mv.setViewName("freeBoard/searchBoardList");
		
		
		return mv;
	}
	
	@RequestMapping("/freeboard/boardList.do")
	public ModelAndView boardList(@RequestParam(value="cPage", defaultValue="1") int cPage,@RequestParam(value="numPerpage",defaultValue="5")int numPerpage,
			ModelAndView mv) {
		log.info("게시판 리스트" );
		mv.addObject("list", service.listAll(cPage,numPerpage)); 
		int totalData = service.totalBoardCount();  //등록된 테이블의 총 개수를 가져다가 저장
		mv.addObject("totalContents", totalData);
		log.debug("");
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, "boardList.do"));
		mv.setViewName("freeBoard/boardList");
		
		return mv;
	}
	
	/*
	 * @PostMapping("reply/replyCnt") public ModelAndView
	 * replyCnt(@RequestParam(value="arr[]") List<Integer> arr, ModelAndView mv,
	 * HttpServletRequest request) { mv.setViewName( "jsonView" ); List<FreeBoard> b
	 * = new ArrayList(); for(int i=0; i<arr.size(); i++) {
	 * //log.info("출력해봐 :"+arr.get(i)); //log.info("================== 배열 확인"+
	 * arr.get(i));
	 * 
	 * int post_Sq = arr.get(i);
	 * 
	 * b = service.replyCnt(post_Sq);
	 * 
	 * log.info("=================="+b.get(0)); mv.addObject("replyNo",b); } return
	 * mv;
	 * 
	 * }
	 */
	
	
	@PostMapping("/freeboard/writeEnd.do") 
	public ModelAndView writeEnd(FreeBoard b, @RequestParam("article_file") MultipartFile[] upload, MultipartFile[] file, ModelAndView mv,HttpServletResponse response, HttpServletRequest req) throws IOException {
		b.setOpen_Yn(req.getParameter("anonymous"));
		log.info("freeboard : "+ b.toString());

		
		for(int i=0; i<file.length; i++) {
            log.info("================== file start ==================");
            log.info("파일 이름: "+file[i].getName());
            log.info("파일 실제 이름: "+file[i].getOriginalFilename());
            log.info("파일 크기: "+file[i].getSize());
            log.info("content type: "+file[i].getContentType());
            log.info("================== file   END ==================");

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
	
	
	@RequestMapping("freeboard/readView")
	public ModelAndView read(FreeBoard fb, ModelAndView mv,  HttpServletRequest request, HttpServletResponse response) {
		log.info("게시글 상세보기에 오신걸 환영합니다.");
		
		int post_Sq = Integer.parseInt(request.getParameter("no")); 
		boolean readFlag = false;
		String boardReadNo="";
		Cookie[] cookies = request.getCookies();
		if(cookies!=null) {
			for(Cookie c : cookies) {
				String name=c.getName();//키값
				String value = c.getValue(); //값
				if(name.equals("boardReadNo")) {
					if(value.contains("|"+post_Sq+"|")) {
						readFlag=true;
						break;
					}
					boardReadNo=value; //현재읽은 게시글 번호
				}
			}
		}
		//읽지않은 글이면 쿠키글에 추가하기 위한 로직
		if(!readFlag) {
			Cookie c= new Cookie("boardReadNo",boardReadNo+"|"+post_Sq+"|");
			c.setMaxAge(-1);
			response.addCookie(c);
		}

			//어태치먼트의 리스트를 불러온다. 해당하는 post_Sq와 맞는
		mv.addObject("list", service.read(post_Sq, readFlag));
		mv.addObject("attachments", service.getAttachment(post_Sq));
		mv.setViewName("freeBoard/readView");
		return mv;
	}
	
	
	@RequestMapping("/freeboard/delete.do")
	public String delete(int no) {
		log.info("delete");
		
		System.out.println(no);
		service.delete(no);
		
		return "redirect:/freeboard/boardList.do";
	}
	
	//oriname같은 String은 그냥 쿼리스트링으로 값이 받아지는데 아래처럼 변수명을 선언하면, int형은 똑같이 int atchNo을 한다고 해서 값이 받아지지 않고 error가 발생하기 때문에~~
	//RequestParam을 사용해서 값을 지정한다.
	@RequestMapping("freeboard/fileDownload.do")
	public void attachDown(String oriname, String rename, @RequestParam("atch_No") int atch_No, HttpServletRequest request, HttpServletResponse res, @RequestHeader(value="user-agent") String header) {
		log.info(oriname);
		log.info(rename);
		log.info("어태치 넘버 : "+atch_No);
		
		
		String path = request.getServletContext().getRealPath("/resources/upload/freeboard/");
			File saveFile = new File(path+rename);
			
			BufferedInputStream bis =null;
			BufferedOutputStream bos = null;
			try {
				bis = new BufferedInputStream(new FileInputStream(saveFile));
				bos = new BufferedOutputStream(res.getOutputStream());
				boolean isMS = header.contains("Trident")||header.contains("MSIE");
				String encodeStr="";
				if(isMS) {
					encodeStr = URLEncoder.encode(oriname,"UTF-8");
					encodeStr=encodeStr.replaceAll("\\+", "%20");
							
				}else {
					encodeStr =  new String(oriname.getBytes("UTF-8"),"ISO-8859-1");
				}
				res.setContentType("application/octet-stream;charset=utf-8");
				res.setHeader("Content-Disposition", "attachment;filename=\""+encodeStr+"\"");
				
				
				int read=-1;
				while((read=bis.read())!= -1) {
					bos.write(read);
				}
				
			}catch(IOException e) {
				e.printStackTrace();
			}finally {
				try {
					bis.close();
					bos.close();
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
			int result = service.fileDownCnt(atch_No);
			
			if(result>0) {
				log.info("다운로드 횟수 증가 성공");
			}else {
				log.info("다운로드 횟수 증가 실패");
			}
	
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
		try {
			log.info("================== update start ==================");
			service.update(fb);
		}catch(Exception e) {
			//FileUtils.deleteQuietly(new File(path+reName));  //저장된 현재 파일 삭제
			e.printStackTrace();
		}
		//수정후에 수정한 게시물 페이지에 있어야한다. 어떻게 해야할까?
		//readView로 보내보자
		mv.addObject("no", request.getParameter("post_Sq"));
		log.info("list" + fb.getAttachments());
		 //mv.addObject("msg",msg); 
		// mv.addObject("loc","/freeboard/readView"); //common/msg에 넣어버리면 location.replace라서 작동안됨.
		 
		//redirect로 수정한 게시물을 보여준다.
		mv.setViewName("redirect:/freeboard/readView");
		return mv;
		}
	
	
	//조횟수 증가
	@RequestMapping("/freeboard/updateBoard.do")
	public ModelAndView updateEnd(ModelAndView mv, FreeBoard fb, Model model,  HttpServletRequest request) {
		
		log.info("수정완료를 눌러주셨군요!! " );
		
		boolean readFlag=false;
		
		int post_Sq = Integer.parseInt(request.getParameter("no"));
				
		model.addAttribute("list", service.read(post_Sq, readFlag));
		
		mv.setViewName("freeBoard/updateView");
		
		return mv;
				
		
	}
	
	@GetMapping("freeboard/write.do")
	public ModelAndView write(ModelAndView mv) {

		mv.setViewName("freeBoard/write");
		return mv;
	}
	
	@PostMapping("freeboard/like.do")
	public ResponseEntity<String> like(@RequestBody FreeBoard fb) {
		log.info("값이 잘 들어가나요? : "+ fb);
		ResponseEntity<String> entity = null;
		try {
			int result = service.likeCnt(fb.getPost_Sq());
			if(result>0) {
				entity = new ResponseEntity<String>("regSuccess",HttpStatus.OK);
			}else {
				entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
			}
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@GetMapping("freeboard/getLikeCnt/{post_Sq}")
	public ResponseEntity<Integer> getLikeCnt(@PathVariable("post_Sq") int post_Sq){
		ResponseEntity<Integer> entity = null;
		try {
			entity= new ResponseEntity<Integer>(service.getLikeCnt(post_Sq), HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	
	
	@PostMapping("freeboard/likeMinus.do")
	public int likeMinus(@RequestBody FreeBoard fb){
		log.info("좋아요 취소");
		int result=0;
		ResponseEntity<Integer> entity = null;
		try {
			result = service.likeMinus(fb.getPost_Sq());
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
		}
		return result;
	}
}
	
	


	
	 

	