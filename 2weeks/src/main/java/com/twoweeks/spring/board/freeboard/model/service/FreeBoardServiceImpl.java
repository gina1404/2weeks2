package com.twoweeks.spring.board.freeboard.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twoweeks.spring.board.freeboard.model.dao.FreeBoardDao;
import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.board.freeboard.model.vo.PostAttachment;
import com.twoweeks.spring.board.freeboard.reply.model.vo.Reply;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FreeBoardServiceImpl implements FreeBoardService {
	
	





	@Autowired
	private FreeBoardDao dao;
	
	@Autowired
	private SqlSession session;

	
	

	@Override
	public List<FreeBoard> list() {
		return dao.list(session);
	}


	@Override
	public List<FreeBoard> listAll(int cPage, int numPerpage) {
		return dao.listAll(session, cPage, numPerpage);
	}


	@Override
	public int totalBoardCount() {
		return dao.totalBoardCount(session);
	}

	@Override
	public List<FreeBoard> searchBoard(Map<String,Object> param) {
		return dao.searchBoard(session,param);
	}


	@Override
	public List<PostAttachment> getAttachment(int post_Sq) {
		return dao.getAttachment(session,post_Sq);
	}


	@Override
	public int insertBoard(FreeBoard b) throws Exception {
		try {
			int result = dao.insertBoard(b, session);
			log.debug("게시글 번호 : " + b.getPost_Sq());
			int boardNo=b.getPost_Sq();
			if(result>0) {
				List<PostAttachment> attachments = b.getAttachments();
				if(attachments.size()>0) {
					for(PostAttachment a : b.getAttachments()) {
						a.setPost_Sq(boardNo); //Board객체에 저장된 게시글 번호를 PostAttachment 객체에 넣어준다.
						dao.insertAttachment(a, session);
					}
			}else if (result > 0) return 1;  //첨부파일이 없을 경우
			else return 0; //첨부파일 실패
		}else return 0; //게시글 등록이 안되었다면
		
	}catch(RuntimeException e) {
		throw new Exception("등록실패");
	}
		return 1;
	}


	@Override
	public FreeBoard read(int post_Sq, boolean readFlag) {
		FreeBoard b = dao.read(session, post_Sq);
		if(b!=null&&!readFlag) {
			int result = dao.updateView(session, post_Sq);
			if(result>0) {
				b.setPost_Cnt(b.getPost_Cnt()+1);
			}
		}
		return b;
	}


	@Override
	public int update(FreeBoard fb) throws Exception {
		try {
			int result = dao.update(session, fb);
			System.out.println(result);
			log.info("게시글 번호 : " + fb.getPost_Sq());
			int boardNo=fb.getPost_Sq();
			if(result>0) {
				List<PostAttachment> attachments = fb.getAttachments();
					if(attachments.size()>0) {
						for(PostAttachment a : fb.getAttachments()) {
							a.setPost_Sq(boardNo);
							dao.updateAttachment(session, a);
						}
					}else if (result > 0) return 1;
					else return 0;
			}else return 0;
		}catch(RuntimeException e) {
			throw new Exception("등록실패");
		}
		
		return 1;
	}


	@Override
	public int delete(int no) {
		return dao.delete(session, no);
	}


	@Override
	public int updateReplyCnt(int post_Sq) {
		return dao.updateReplyCnt(session, post_Sq);
	}


	@Override
	public List<FreeBoard> replyCnt(int post_Sq) {
		return dao.replyCnt(session, post_Sq);
	}

	//파일 다운로드
	@Override
	public int fileDownCnt(int atch_No) {
		return dao.fileDownCnt(session, atch_No);
	}

	//좋아요 수 증가
	@Override
	public int likeCnt(int post_Sq) {
		return dao.likeCnt(session, post_Sq);
	}


	@Override
	public int getLikeCnt(int post_Sq) {
		return dao.getLikeCnt(session, post_Sq);
	}


	@Override
	public int likeMinus(int post_Sq) {
		return dao.likeMinus(session, post_Sq);
	}


	@Override
	public List<PostAttachment> listAttachment() {
		return dao.listAttachment(session);
	}
	
	
	
}
