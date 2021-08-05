package com.twoweeks.spring.admin.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.twoweeks.spring.admin.model.vo.Notice;
import com.twoweeks.spring.member.model.vo.Member;

public interface AdminService {
	int insertNotice(Notice n);
	List<Member> selectMemberList();
}
