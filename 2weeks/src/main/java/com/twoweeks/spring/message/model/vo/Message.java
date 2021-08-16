package com.twoweeks.spring.message.model.vo;



import java.util.Date;

import lombok.Data;

@Data
public class Message {
	
	private String no;
	private int room;
	private String send_nic;
	private String recv_nic;
	private Date send_time;
	private Date read_time;
	private String content;
	private String read_chk;
	//현재 메세지 상대
	private String other_nick;
	
	//현재메세지 상대 profile
	private String profile;
	private String user_Pfrename;
	
	//현재 사용자 닉네임
	private String nick;
	//안읽은메세지
	private int unread;

}
