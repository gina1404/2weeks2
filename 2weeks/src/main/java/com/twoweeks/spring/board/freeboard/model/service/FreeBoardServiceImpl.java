package com.twoweeks.spring.board.freeboard.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.twoweeks.spring.board.freeboard.model.dao.FreeBoardDao;
import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {

	private FreeBoardDao freeboardDao;
	
	@Override
	public int create(FreeBoard freeBoard) throws Exception {
		return freeboardDao.create(freeBoard);
	}

	@Override
	public FreeBoard read(int post_Sq) throws Exception {
		return freeboardDao.read(post_Sq);
	}

	@Override
	public void update(FreeBoard freeBoard) throws Exception {
		freeboardDao.update(freeBoard);
	}

	@Override
	public void delete(int post_Sq) throws Exception {
		freeboardDao.delete(post_Sq);
	}

	@Override
	public List<FreeBoard> listAll() throws Exception {
		return freeboardDao.listAll();
	}

	
	
	
}
