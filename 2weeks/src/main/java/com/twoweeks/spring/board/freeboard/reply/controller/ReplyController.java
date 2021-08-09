package com.twoweeks.spring.board.freeboard.reply.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.board.freeboard.model.vo.PREPLY;
import com.twoweeks.spring.board.freeboard.reply.model.service.ReplyService;
import com.twoweeks.spring.board.freeboard.reply.model.vo.Reply;
import com.twoweeks.spring.common.PageFactory;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ReplyController {

	
	
	@Autowired
	private ReplyService service;
	
	

	
	@PostMapping("reply/insert")
	public ResponseEntity<String> register(@RequestBody Reply reply){
		log.info("reply : "+ reply);
		ResponseEntity<String> entity = null;
		try {
			service.create(reply);
			entity = new ResponseEntity<String>("regSuccess", HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@GetMapping("replies/all/{post_Sq}")
	public ResponseEntity<List<Reply>> list(@PathVariable("post_Sq") int post_Sq){
			ResponseEntity<List<Reply>> entity = null;
			try {
				entity = new ResponseEntity<List<Reply>>(service.list(post_Sq), HttpStatus.OK);
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<List<Reply>>(HttpStatus.BAD_REQUEST);
			}
		return entity;
	}
	
	@RequestMapping(value = "replies/{reply_Sq}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("reply_Sq") int reply_Sq, @RequestBody Reply reply){
		ResponseEntity<String> entity = null;
		try {
			reply.setReply_Sq(reply_Sq);
			service.update(reply);
			entity = new ResponseEntity<String>("modSuccess", HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value= "reply/delete/{reply_Sq}", method= RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("reply_Sq") int reply_Sq){
		ResponseEntity<String> entity = null;
		try {
			service.delete(reply_Sq);
			entity = new ResponseEntity<String>("delSuccess", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@GetMapping("/{post_Sq}")
	public ResponseEntity<Map<String,Object>> listPaging(@PathVariable("post_Sq") int post_Sq, HttpServletRequest request, HttpSession session,
			@RequestParam(value="cPage", defaultValue="1") int cPage, @RequestParam(value="numPerpage",defaultValue="5") int numPerpage){
		ResponseEntity<Map<String,Object>> entity = null;
		
		try {
			List<Reply> replies = service.listAll(post_Sq, cPage, numPerpage);
			int repliesCount = service.countReplies(post_Sq);
			String pageBar  = PageFactory.getPageBar(repliesCount, cPage, numPerpage, "${post_Sq}");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("replies", replies);
			map.put("repliesCount", repliesCount);
			map.put("pageBar", pageBar);
			
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
