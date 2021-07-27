package com.twoweeks.spring.board.freeboard.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;

public class FreeBoardImpl implements FreeBoardDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void create(FreeBoard freeBoard) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public FreeBoard read(int post_Sq) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(FreeBoard freeBoard) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int post_Sq) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<FreeBoard> listAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
}
