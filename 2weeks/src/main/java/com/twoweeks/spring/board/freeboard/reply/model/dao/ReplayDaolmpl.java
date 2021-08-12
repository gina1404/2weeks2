package com.twoweeks.spring.board.freeboard.reply.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.board.freeboard.model.vo.PREPLY;
import com.twoweeks.spring.board.freeboard.reply.model.vo.Reply;

@Repository
public class ReplayDaolmpl implements ReplyDao {

	

	@Override
	public List<Reply> list(SqlSession session, int post_Sq) throws Exception {
		
		return session.selectList("reply.list", post_Sq);
	}

	@Override
	public int create(SqlSession session, Reply reply) throws Exception {
		return session.insert("reply.create",reply);
	}

	@Override
	public int update(SqlSession session, Reply reply) throws Exception {
		return session.update("reply.update",reply);
	}

	@Override
	public int delete(SqlSession session, int reply_Sq) throws Exception {
		return session.delete("reply.delete",reply_Sq);
	}

	@Override
	public List<Reply> listAll(SqlSession session, int post_Sq, int cPage, int numPerpage) {
		return session.selectList("reply.listAll",null, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	@Override
	public int countReplies(SqlSession session, int post_Sq) {
		return session.selectOne("reply.countReplies");
	}

	@Override
	public List<Reply> selectBoardComment(SqlSession session, int no) {
		return session.selectList("reply.selectBoardComment",no);
	}

	@Override
	public int rereplyInsert(SqlSession session, Reply reply) {
		return session.insert("reply.rereplyInsert",reply);
	}

	
}
