package com.twoweeks.spring.know.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.twoweeks.spring.know.model.vo.Kin;
import com.twoweeks.spring.know.model.vo.KinAttachment;

public interface KnowledgeInDao {
	List<Kin> selectKinList(SqlSession session, int cPage, int numPerpage);
	
	int selectKinCount(SqlSession session); //조회수
	
	int insertKin(SqlSession session,Kin k); //글 작성
	
	int insertKinAttachment(SqlSession session,KinAttachment k); //첨부파일 첨부

	int deleteKin(SqlSession session,int sq)throws Exception;
	
	Kin selectKinOne(SqlSession session, int sq);

	
	
	
}
