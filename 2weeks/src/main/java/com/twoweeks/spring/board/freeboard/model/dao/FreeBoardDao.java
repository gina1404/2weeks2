package com.twoweeks.spring.board.freeboard.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.board.freeboard.model.vo.PostAttachment;

public interface FreeBoardDao {

	/*
	 * int create(FreeBoard freeBoard) throws Exception;
	 * 
	 * FreeBoard read(int post_Sq) throws Exception;
	 * 
	 * void update(FreeBoard freeBoard) throws Exception;
	 * 
	 * void delete(int post_Sq) throws Exception;
	 */
	

	int insertBoard(FreeBoard b, SqlSession session);

	int insertAttachment(PostAttachment a, SqlSession session);
	
	List<FreeBoard> listAll(SqlSession session, int cPage, int numPerpage);
	
	int totalBoardCount(SqlSession session);
		
	
	
}
