package com.twoweeks.spring.board.freeboard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.board.freeboard.model.vo.PostAttachment;

@Repository
public class FreeBoardDaoImpl implements FreeBoardDao {


	
	@Override
	public List<FreeBoard> listAll(SqlSession session, int cPage, int numPerpage) {
		return session.selectList("freeboard.listAll", null, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	@Override
	public int totalBoardCount(SqlSession session) {
		return session.selectOne("freeboard.totalBoardCount");
	}

	/*
	 * @Override public int create(FreeBoard freeBoard) throws Exception { return
	 * session.insert("freeboard.create", freeBoard);
	 * 
	 * }
	 * 
	 * @Override public FreeBoard read(int post_Sq) throws Exception { return
	 * session.selectOne("freeboard.read",post_Sq); }
	 * 
	 * @Override public void update(FreeBoard freeBoard) throws Exception {
	 * session.update("freeboard.update", freeBoard); }
	 * 
	 * @Override public void delete(int post_Sq) throws Exception {
	 * session.delete("freeboard.delete",post_Sq); }
	 */


	@Override
	public int insertBoard(FreeBoard b, SqlSession session) {
		return session.insert("freeboard.insertBoard", b);
	}

	@Override
	public int insertAttachment(PostAttachment a, SqlSession session) {
		return session.insert("freeboard.insertAttachment", a);
	}

	@Override
	public List<FreeBoard> list(SqlSession session, FreeBoard fb) {
		return session.selectList("freeboard.list",fb);
	}


	@Override
	public List<FreeBoard> searchBoard(SqlSession session, Map<String,Object> param) {
		return session.selectList("freeboard.searchBoard",param);
	}

	@Override
	public FreeBoard read(SqlSession session, int bno) {
		return session.selectOne("freeboard.read",bno);
	}

	@Override
	public int update(SqlSession session, FreeBoard fb) {
		return session.update("freeboard.update", fb);
	}

	@Override
	public int delete(SqlSession session, int no) {
		return session.delete("freeboard.delete", no);
	}

	@Override
	public int updateAttachment(SqlSession session, PostAttachment a) {
		return session.insert("freeboard.updateAttachment", a);
	}

	
}
