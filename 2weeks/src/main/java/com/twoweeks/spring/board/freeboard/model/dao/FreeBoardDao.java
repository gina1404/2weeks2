package com.twoweeks.spring.board.freeboard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.board.freeboard.model.vo.PostAttachment;
import com.twoweeks.spring.board.freeboard.reply.model.vo.Reply;

public interface FreeBoardDao {

	

	int insertBoard(FreeBoard b, SqlSession session);

	int insertAttachment(PostAttachment a, SqlSession session);
	
	List<FreeBoard> listAll(SqlSession session, int cPage, int numPerpage);
	
	int totalBoardCount(SqlSession session);

	List<FreeBoard> list(SqlSession session, FreeBoard fb);

	List<FreeBoard> searchBoard(SqlSession session, Map<String,Object> param);
		
	public FreeBoard read(SqlSession session, int bno);
	
	int delete(SqlSession session, int no);
	
	int update(SqlSession session, FreeBoard fb); 

	int updateAttachment(SqlSession session, PostAttachment a);

	List<FreeBoard> selectMyBoard(SqlSession session, String userId);
	
}
