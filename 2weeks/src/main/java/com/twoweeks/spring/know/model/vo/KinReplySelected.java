package com.twoweeks.spring.know.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KinReplySelected {
	
	private String userId; //회원 Id
	private int reply_Sq; // 지식인 답글 번호
}
