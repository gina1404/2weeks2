package com.twoweeks.spring.board.freeboard.reply.model.service;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twoweeks.spring.board.freeboard.reply.model.dao.ReplyDao;
import com.twoweeks.spring.board.freeboard.reply.model.vo.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Reply> list(int post_Sq) throws Exception {
		return dao.list(session, post_Sq);
	}

	@Override
	public int create(Reply reply) throws Exception {
		return dao.create(session, reply);
	}


	@Override
	public int update(Reply reply) throws Exception {
		return dao.update(session, reply);
	}

	@Override
	public int delete(int reply_Sq) throws Exception {
		return dao.delete(session, reply_Sq);
	}


	@Override
	public int countReplies(int post_Sq) {
		return dao.countReplies(session, post_Sq);
	}

	@Override
	public List<Reply> selectBoardComment(int no) {
		return dao.selectBoardComment(session,no);
	}

	@Override
	public int rereplyInsert(Reply reply) {
		return dao.rereplyInsert(session,reply);
	}
	
	
}
