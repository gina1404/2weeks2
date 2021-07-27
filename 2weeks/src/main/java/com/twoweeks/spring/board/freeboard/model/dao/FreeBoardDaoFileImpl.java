package com.twoweeks.spring.board.freeboard.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDaoFileImpl implements FreeBoardFileDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public void addAttach(String atchNew, int atchNo) throws Exception {
	Map<String, Object> paramMap = new HashMap<String, Object>();
	paramMap.put("atchNew", atchNew);
	paramMap.put("atchNo", atchNo);
	session.insert("postAttahchment.addAttach", paramMap);
		
	}

	@Override
	public List<String> getAttach(int atchNo) throws Exception {
		
		return session.selectList("postAttahchment.getAttach",atchNo);
	}

	@Override
	public void replaceAttach(String atchNew, int atchNo) throws Exception {
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("atchNew", atchNew);
		paramMap.put("atchNo",atchNo);
		session.insert("postAttahchment.replaceAttach",paramMap);
		
		
		
	}

	@Override
	public void deleteAttach(String atchNew) throws Exception {
		session.delete("postAttahchment.deleteAttach", atchNew);
		
	}

	@Override
	public void deleteAllAttach(int atchNo) throws Exception {
		session.delete("postAttahchment.deleteAllAttach",atchNo);
		
	}

	@Override
	public void updateAttachCnt(int atchNo) throws Exception {
		session.update("postAttahchment.updateAttachCnt",atchNo);
		
	}

	
}
