package com.twoweeks.spring.board.freeboard.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;

public interface FreeBoardService {

	/*
	 * int create(FreeBoard freeBoard) throws Exception;
	 * 
	 * FreeBoard read(int post_Sq) throws Exception;
	 * 
	 * void update(FreeBoard freeBoard) throws Exception;
	 * 
	 * void delete(int post_Sq) throws Exception;
	 */
	
	List<FreeBoard> listAll(int cPage, int numPerpage);

	int insertBoard(FreeBoard b) throws Exception;
	
	int totalBoardCount();

	List<FreeBoard> list(FreeBoard fb);

	List<FreeBoard> searchBoard(Map<String,Object> param);
	
	FreeBoard read(int bno);
	
}
