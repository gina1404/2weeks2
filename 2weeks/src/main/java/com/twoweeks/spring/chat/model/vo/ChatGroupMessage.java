package com.twoweeks.spring.chat.model.vo;

import lombok.Data;

@Data
public class ChatGroupMessage {

    private int chatGroupNo;
    private String sender;
    private String chatContent;
    private String chatTime;    
	
}
