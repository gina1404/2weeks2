package com.twoweeks.spring.search.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.twoweeks.spring.search.model.vo.DummyData;

public interface SearchDao {

	//블로그 크롤링 정보를 DB에 저장
	int insertBlogDummy (SqlSessionTemplate session, DummyData dd);
}
