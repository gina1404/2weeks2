package com.twoweeks.spring.know.model.service;

import java.util.List;

import com.twoweeks.spring.know.model.vo.Kin;
import com.twoweeks.spring.know.model.vo.KinReply;

public interface KnowledgeInService {
	List<Kin> selectKinList(int cPage, int numPerpage); //글 목록 조회
	
	List<Kin> selectKinListcnt(int cPage, int numPerpage); //글 목록 조회수별로 조회

	List<Kin> selectKinListMyQ(int cPage, int numPerpage); //글 목록 나의 질문
	
	List<Kin> selectKinListMyA(int cPage, int numPerpage); //글 목록 나의 답변
	
	List<Kin> list(Kin k);
	
	int selectKinCount(); //총 글 개수
	
	int selectKinReplyCount(int sq) throws Exception;//총 답글 개수
	
	int insertKin(Kin k) throws Exception;    //글 등록

	Kin selectKinOne(int sq) throws Exception; 
	
	List<KinReply> selectReplyOne(int sq) throws Exception; 
	
	public void delete(int sq)throws Exception; //게시글 삭제

	int insertKinReply(KinReply kr) throws Exception;
	
	int update(Kin k) throws Exception; //글 수정
	
	void updateReplyCount(int sq)throws Exception;






	

}
