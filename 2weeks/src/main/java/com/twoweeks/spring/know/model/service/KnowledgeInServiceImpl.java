package com.twoweeks.spring.know.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twoweeks.spring.know.model.dao.KnowledgeInDao;
import com.twoweeks.spring.know.model.vo.Kin;
import com.twoweeks.spring.know.model.vo.KinAttachment;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j

public class KnowledgeInServiceImpl implements KnowledgeInService {
	@Autowired
	private KnowledgeInDao dao;
	@Autowired
	private SqlSession session;
	
	
	@Override
	public List<Kin> selectKinList(int cPage, int numPerpage) {
		
		return dao.selectKinList(session,cPage,numPerpage);
	}

	@Override
	public int selectKinCount() {
	
		return dao.selectKinCount(session);
	}

	@Override
	public int insertKin(Kin k) throws Exception{
		try {
		int result= dao.insertKin(session,k);
		log.debug("게시글번호 :"+k.getKin_Sq());
		int kinSq=k.getKin_Sq();
		if(result>0) {
			List<KinAttachment> attachment=k.getAttachments();
			if(k.getAttachments().size()>0) {
				for(KinAttachment a: attachment) {
					a.setKin_Sq(kinSq);
					result=dao.insertKinAttachment(session,a);
				}
			}else if (result >0) return 1;
			else return 0; //첨부파일 실패
		}else return 0;   //지식인 글 등록이 안되어있으면
		}catch(RuntimeException e) {
			throw new Exception("등록실패");
		}
		return 1;
	}

	@Override
	public Kin selectKinOne(int sq) {
		return dao.selectKinOne(session,sq);
	}

	@Override
	public int deleteKin(int sq) throws Exception {
		
		return dao.deleteKin(session,sq);
	}
	

}
