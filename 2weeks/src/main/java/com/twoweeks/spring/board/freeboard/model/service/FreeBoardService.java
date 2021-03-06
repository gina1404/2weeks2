package com.twoweeks.spring.board.freeboard.model.service;

import java.util.List;
import java.util.Map;

import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.board.freeboard.model.vo.PostAttachment;
import com.twoweeks.spring.board.freeboard.model.vo.Post_Likes;
import com.twoweeks.spring.board.freeboard.reply.model.vo.Reply;

public interface FreeBoardService {


	
	List<FreeBoard> listAll(int cPage, int numPerpage);

	int insertBoard(FreeBoard b) throws Exception;
	
	int totalBoardCount();

	List<FreeBoard> list();

	List<FreeBoard> searchBoard(Map<String,Object> param);
	
	FreeBoard read(int post_Sq, boolean readFlag);
	
	int update(FreeBoard fb) throws Exception;
	
	int delete(int no);
	
	List<FreeBoard> selectMyBoard(String loginId, int cPage, int numPerpage);


	int myBoardCount(String loginId);

	int updateReplyCnt(int post_Sq);

	List<FreeBoard> replyCnt(int post_Sq);

	List<PostAttachment> getAttachment(int post_Sq);

	int fileDownCnt(int atch_No);

	int likeCnt(Post_Likes pl);

	int getLikeCnt(int post_Sq);

	int likeMinus(Post_Likes pl);

	List<PostAttachment> listAttachment();


	
}
