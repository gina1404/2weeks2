package com.twoweeks.spring.know.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twoweeks.spring.know.model.dao.KnowledgeInDao;
import com.twoweeks.spring.know.model.vo.Kin;
import com.twoweeks.spring.know.model.vo.KinAttachment;
import com.twoweeks.spring.know.model.vo.KinReply;
import com.twoweeks.spring.know.model.vo.KinReplyAttachment;
import com.twoweeks.spring.member.model.dao.MemberDao;
import com.twoweeks.spring.member.model.vo.Member;

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
	public List<Kin> selectKinListcnt(int cPage, int numPerpage) {
		
		return dao.selectKinListcnt(session,cPage,numPerpage);
	}



	@Override
	public List<Kin> selectKinListMyQ(int cPage, int numPerpage) {
		
		return dao.selectKinListMyQ(session,cPage,numPerpage);
	}

	@Override
	public List<Kin> selectKinListMyA(int cPage, int numPerpage) {
		
		return dao.selectKinListMyA(session,cPage,numPerpage);
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
	public Kin selectKinOne(int sq) throws Exception {
		dao.updatecnt(session, sq);
		return dao.selectKinOne(session,sq);
	}

	
	
	@Override
	public List<KinReply> selectReplyOne(int sq) throws Exception {
		
		return dao.selectReplyOne(session,sq);
	}

	
	
	@Override
	public void delete(int sq) throws Exception {
		
		dao.delete(session, sq);
	}


	
	@Override
	public int insertKinReply(KinReply kr ) throws Exception {
		try {
			int result= dao.insertKinReply(session,kr);
			log.debug("답글번호 :"+kr.getReply_Sq());
			int replySq=kr.getReply_Sq();
		
			if(result>0) {	
				dao.updateReplyCount(session, replySq);
				List<KinReplyAttachment> attachment=kr.getAttachment();
				if(kr.getAttachment().size()>0) {
					for(KinReplyAttachment a: attachment) {
						a.setReply_Sq(replySq);
						result=dao.insertKinReplyAttachment(session,a);
					}
				}else if (result >0) return 1;
				else return 0; //첨부파일 실패
			}else return 0;   //지식인 글 등록이 안되어있으면
			}catch(RuntimeException e) {
				throw new Exception("등록실패");
			}
		

			return 1;
		}

	//게시글 수정
	/*
	 * @Override public void update(Kin k) throws Exception {
	 * 
	 * dao.update(session, k);
	 * 
	 * }
	 */


	@Override
	public int update(Kin k) throws Exception {
		try {
			int result = dao.update(session, k);
			System.out.println(result);
			
			log.info("게시글 번호 : " +k.getKin_Sq()); // 0??????????????
			log.info("게시글 내용 : " +k.getKin_Content());
			log.info("카테고리 : " +k.getCategory());
					int sq= k.getKin_Sq();
			if(result>0) {
				List<KinAttachment> attachments = k.getAttachments();
					if(attachments.size()>0) {
						for(KinAttachment ka : k.getAttachments()) {
							ka.setKin_Sq(sq);
							ka.setAtch_No(sq);
							dao.updateKinAttachment(session, ka);
						}
					}else if (result > 0) 
							return 1;
					else return 0;
			}else return 0;
		}catch(RuntimeException e) {
			throw new Exception("수정 실패");
		}
		
		return 1;
	}
	

	
	@Override
	public int selectKinReplyCount(int sq)  throws Exception{
		// TODO Auto-generated method stub
		return dao.selectKinReplyCount(session,sq);
	}

	@Override
	public List<Kin> list(Kin k) {
		
		return dao.list(session, k);
	}

	@Override
	public void updateReplyCount(int sq)throws Exception{
		
	 dao.updateReplyCount(session, sq);
	}


	@Override
	public int updatePoint(Member m) throws Exception {
		return dao.updatePoint(session, m);
		
		
		
		
		
	}




	
	

}
