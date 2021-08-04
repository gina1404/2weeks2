package com.twoweeks.spring.know.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.twoweeks.spring.know.model.vo.Kin;
import com.twoweeks.spring.know.model.vo.KinAttachment;

@Repository
public class KnowledgeInDaoImpl implements KnowledgeInDao {

	@Override
	public List<Kin> selectKinList(SqlSession session, int cPage, int numPerpage) {
		return session.selectList("knowledgeIn.selectKinList",null,
				new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int selectKinCount(SqlSession session) {
		
		return session.selectOne("knowledgeIn.selectKinCount");

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
	public int deleteKin(SqlSession session,int sq) {
		
		return session.delete("knowledgeIn.delete",sq);
	}

}
