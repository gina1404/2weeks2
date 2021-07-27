package com.twoweeks.spring.board.freeboard.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;

@Repository
public class FreeBoardImpl implements FreeBoardDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public int create(FreeBoard freeBoard) throws Exception {
		return session.insert("freeboard.create", freeBoard);
		
	}

	@Override
	public FreeBoard read(int post_Sq) throws Exception {
		return session.selectOne("freeboard.read",post_Sq);
	}

	@Override
	public void update(FreeBoard freeBoard) throws Exception {
		session.update("freeboard.update", freeBoard);
	}

	@Override
	public void delete(int post_Sq) throws Exception {
		session.delete("freeboard.delete",post_Sq);
	}

	@Override
	public List<FreeBoard> listAll() throws Exception {
		return session.selectList("freeboard.listAll");
	}

	
}
