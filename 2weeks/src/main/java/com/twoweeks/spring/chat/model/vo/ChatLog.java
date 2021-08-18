package com.twoweeks.spring.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatLog {

	private int chatNo;
	private String chatId;
	private String chatName;
	
}
