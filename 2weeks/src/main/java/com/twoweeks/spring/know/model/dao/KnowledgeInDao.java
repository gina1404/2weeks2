package com.twoweeks.spring.know.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.twoweeks.spring.know.model.vo.Kin;
import com.twoweeks.spring.know.model.vo.KinAttachment;
import com.twoweeks.spring.know.model.vo.KinReply;
import com.twoweeks.spring.know.model.vo.KinReplyAttachment;

public interface KnowledgeInDao {
	List<Kin> selectKinList(SqlSession session, int cPage, int numPerpage);
	
	int selectKinCount(SqlSession session); //총 건수
	
	int selectKinReplyCount(SqlSession session); //답글 개수
	
	int insertKin(SqlSession session,Kin k); //글 작성
	
	int insertKinAttachment(SqlSession session,KinAttachment k); //첨부파일 첨부
	
	int insertKinReplyAttachment(SqlSession session,KinReplyAttachment kra); //답글 첨부파일 첨부
	
	int insertKinReply(SqlSession session,KinReply kr); //답글 작성

	public void delete(SqlSession session,int sq) throws Exception; //글 삭제
	
	Kin selectKinOne(SqlSession session, int sq); //글 상세보기

	void updatecnt(SqlSession session,int sq)throws Exception;//조회수
	
	int update(SqlSession session, Kin k); //글 수정

	int updateKinAttachment(SqlSession session, KinAttachment ka); //첨부파일 수정

	
	List<Kin> list(SqlSession session, Kin k);
	
	
	
}
