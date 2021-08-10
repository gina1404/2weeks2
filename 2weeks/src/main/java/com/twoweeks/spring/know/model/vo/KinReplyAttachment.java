package com.twoweeks.spring.know.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class KinReplyAttachment {

		private int atch_No; //첨부파일 번호
		private int reply_Sq; //답글 번호 참조
		private String atch_Ori;// 원본 파일 이름
		private String atch_New;//리네임 파일 이름
		
	
}
