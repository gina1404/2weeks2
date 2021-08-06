package com.twoweeks.spring.board.freeboard.reply.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.twoweeks.spring.board.freeboard.reply.model.vo.Reply;

public interface ReplyDao {
	
	List<Reply> list(SqlSession session,int post_Sq) throws Exception;
	
	int create(SqlSession session,Reply reply) throws Exception;
	
	int update(SqlSession session,Reply reply) throws Exception;
	
	int delete(SqlSession session, int reply_Sq)  throws Exception;
	
	List<Reply> listAll(SqlSession session, int Cpage, int numPerpage);
	
	int countReplies(SqlSession session); 
	
}
