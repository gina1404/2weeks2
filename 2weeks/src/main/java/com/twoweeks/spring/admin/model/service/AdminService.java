package com.twoweeks.spring.admin.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.twoweeks.spring.admin.model.vo.Grant;
import com.twoweeks.spring.admin.model.vo.Notice;
import com.twoweeks.spring.admin.model.vo.Point;
import com.twoweeks.spring.admin.model.vo.Report;
import com.twoweeks.spring.member.model.vo.Member;

public interface AdminService {
	int insertNotice(Notice n);
	List<Member> selectMemberList();
	int selectMembercount();
	int deleteMember(String userId);
	int insertPointEnd(Point re);
	int selectMemberPoint(String name);
	int updatePointEnd(Point re);
	List<Report>adminReporttable();
	int selectReportCount();
	int reportUpdateYn(String pk);
	List<Report>reportList(String userId);
	List<Grant>selectGrantTable();
	int updateGrantTable(String userId);
	int updateGrantMember(Member m);
}
