package com.twoweeks.spring.board.freeboard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.board.freeboard.model.vo.PostAttachment;
import com.twoweeks.spring.board.freeboard.reply.model.vo.Reply;

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


	@Override
	public int insertBoard(FreeBoard b, SqlSession session) {
		return session.insert("freeboard.insertBoard", b);
	}

	@Override
	public int insertAttachment(PostAttachment a, SqlSession session) {
		return session.insert("freeboard.insertAttachment", a);
	}

	@Override
	public List<FreeBoard> list(SqlSession session) {
		return session.selectList("freeboard.list");
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

	@Override
	public int updateView(SqlSession session, int post_Sq) {
		return session.update("freeboard.updateView",post_Sq);
	}

	@Override
	public int updateReplyCnt(SqlSession session, int post_Sq) {
		return session.update("freeboard.updateReplyCnt",post_Sq);
	}

	@Override
	public List<FreeBoard> replyCnt(SqlSession session, int post_Sq) {
		return session.selectList("freeboard.replyCnt",post_Sq);
	}

	@Override
	public List<PostAttachment> getAttachment(SqlSession session, int post_Sq) {
		return session.selectList("freeboard.getAttachment",post_Sq);
	}

	@Override
	public int fileDownCnt(SqlSession session, int atch_No) {
		return session.update("freeboard.fileDownCnt",atch_No);
	}

	@Override
	public int likeCnt(SqlSession session, int post_Sq) {
		return session.update("freeboard.likeCnt",post_Sq);
	}

	@Override
	public int getLikeCnt(SqlSession session, int post_Sq) {
		return session.selectOne("freeboard.getLikeCnt",post_Sq);
	}

	@Override
	public int likeMinus(SqlSession session, int post_Sq) {
		return session.update("freeboard.likeMinus",post_Sq);
	}

	@Override
	public List<PostAttachment> listAttachment(SqlSession session) {
		return session.selectList("freeboard.listAttachment");
	}

	

	public List<FreeBoard> selectMyBoard(SqlSession session, String userId) {
		return session.selectList("freeboard.selectMyBoard", userId);
	}

	
	
}
