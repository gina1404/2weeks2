package com.twoweeks.spring.search.model.service;

import java.util.List;

import com.twoweeks.spring.search.model.vo.SearchExternalNaver;

public interface SearchService {

	
	List<SearchExternalNaver> searchExternalNaver(String searchKeyword);
}
