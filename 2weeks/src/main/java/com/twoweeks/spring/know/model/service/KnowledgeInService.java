package com.twoweeks.spring.know.model.service;

import java.util.List;

import com.twoweeks.spring.know.model.vo.Kin;

public interface KnowledgeInService {
	List<Kin> selectKinList(int cPage, int numPerpage);
	
	int selectKinCount();
	
	int insertKin(Kin k) throws Exception;    //글 등록

	Kin selectKinOne(int sq);
	
	int deleteKin(int sq) throws Exception; //글삭제
}
