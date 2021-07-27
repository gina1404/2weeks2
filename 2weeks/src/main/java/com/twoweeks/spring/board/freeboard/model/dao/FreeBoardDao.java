package com.twoweeks.spring.board.freeboard.model.dao;

import java.util.List;

public interface FreeBoardDao {

	//게시글 첨부파일 추가
	public void addAttach(String atchNew, int atchNo) throws Exception;
	
	//게시글 첨부파일 조회
	public List<String> getAttach(int atchNo) throws Exception;
	
	//첨부파일 수정
	public void replaceAttach(String atchNew, int atchNo) throws Exception;
	
	
	//첨부파일 삭제
	public void deleteAttach(String atchNew) throws Exception;
	
	//게시글 첨부파일 일괄 삭제
	public void deleteAllAttach(int atchNo) throws Exception;
	
	//특정 게시글의 첨부파일 갯수 갱신
	public void updateAttachCnt(int atchNo) throws Exception;
	
	
}
