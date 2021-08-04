package com.twoweeks.spring.admin.model.service;

import org.springframework.stereotype.Service;

import com.twoweeks.spring.admin.model.vo.Notice;

public interface AdminService {
	int insertNotice(Notice n);
}
