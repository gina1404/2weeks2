package com.twoweeks.spring.board.freeboard.model.dao;

import java.util.List;

import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;

public interface FreeBoardDao {

	int create(FreeBoard freeBoard) throws Exception;
	
	FreeBoard read(int post_Sq) throws Exception;
	
	void update(FreeBoard freeBoard) throws Exception;
	
	void delete(int post_Sq) throws Exception;
	
	List<FreeBoard> listAll() throws Exception;
	
}
