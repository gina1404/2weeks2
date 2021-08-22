package com.twoweeks.spring.know.model.vo;



import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.twoweeks.spring.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KinReply {

	private int reply_Sq;//답글번호
	private String reply_Writer; //답글 작성자ID
	private int kin_Sq; //게시글참조
	private String reply_Content;//답글 본문
	private String reply_Image;// 답글 첨부파일 이미지
	private int reply_Like_Cnt;// 좋아요 개수
	private Date reply_Date; // 답글 작성일 
	private String open_Yn; //아이디 공개여부 
	private List<KinReplyAttachment> attachment=new ArrayList();
}
