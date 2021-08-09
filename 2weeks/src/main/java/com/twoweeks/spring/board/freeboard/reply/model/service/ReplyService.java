package com.twoweeks.spring.board.freeboard.reply.model.service;

import java.util.List;

import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.board.freeboard.model.vo.PREPLY;
import com.twoweeks.spring.board.freeboard.reply.model.vo.Reply;

public interface ReplyService {

	
		List<Reply> list(int post_Sq) throws Exception;
		
		int create(Reply reply) throws Exception;
		int update(Reply reply) throws Exception;
		int delete(int reply_Sq) throws Exception;
		
		List<Reply> listAll(int post_Sq, int Cpage, int numPerpage);
		
		int countReplies(int post_Sq);

		List<Reply> selectBoardComment(int no);
}
