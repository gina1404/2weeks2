package com.twoweeks.spring.know.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.twoweeks.spring.know.model.vo.Kin;
import com.twoweeks.spring.know.model.vo.KinAttachment;
import com.twoweeks.spring.know.model.vo.KinReply;
import com.twoweeks.spring.know.model.vo.KinReplyAttachment;

@Repository
public class KnowledgeInDaoImpl implements KnowledgeInDao {
	
	
	
	@Override
	public List<Kin> selectKinList(SqlSession session, int cPage, int numPerpage) {
		return session.selectList("knowledgeIn.selectKinList",null,
				new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	

	@Override public List<Kin> selectKinListcnt(SqlSession session, int cPage,
	  int numPerpage) { return session.selectList("knowledgeIn.cnt",null, new
	  RowBounds((cPage-1)*numPerpage,numPerpage)); }
	 
	
	@Override
	public int selectKinCount(SqlSession session) {
		
		return session.selectOne("knowledgeIn.selectKinCount");

	}

	@Override
	public int selectKinReplyCount(SqlSession session) {
		
		return session.selectOne("knowledgeIn.selectKinReplyCount");

	}
	
	
	@Override
	public int insertKin(SqlSession session, Kin k) {
		return session.insert("knowledgeIn.insertKin",k);
	}

	@Override
	public int insertKinAttachment(SqlSession session, KinAttachment k) {
		// TODO Auto-generated method stub
		return session.insert("knowledgeIn.insertKinAttachment",k);
	}

	@Override
	public Kin selectKinOne(SqlSession session, int sq) {
		return session.selectOne("knowledgeIn.selectKinOne",sq);
	}

	@Override
	public List<KinReply> selectReplyOne(SqlSession session, int sq) {
		return session.selectList("knowledgeIn.selectReplyOne",sq);
	}


	@Override
	public void delete(SqlSession session,int sq)throws Exception {
		
		session.delete("knowledgeIn.delete",sq);
	}

	@Override
	public void updatecnt(SqlSession session,int sq)throws Exception{
		session.update("knowledgeIn.updatecnt",sq);
		
	}

	@Override
	public int insertKinReply(SqlSession session, KinReply kr) {
		return session.insert("knowledgeIn.insertKinReply",kr);
		
	}

	@Override
	public int insertKinReplyAttachment(SqlSession session, KinReplyAttachment kra) {
		
		return session.insert("knowledgeIn.insertKinReplyAttachment",kra);
	}
	
	@Override
	public int update(SqlSession session, Kin k) {
		return session.update("knowledgeIn.update", k);
	}

	@Override
	public int updateKinAttachment(SqlSession session, KinAttachment ka) {
		return session.insert("knowledgeIn.updateKinAttachment",ka);
	}

	@Override
	public List<Kin> list(SqlSession session, Kin k) {
		return session.selectList("knowledgeIn.list",k);
	}






}
