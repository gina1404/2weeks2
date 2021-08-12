package com.twoweeks.spring.search.model.service;

import java.util.List;
import java.util.Map;


public interface SearchService {
	
	List<Map<String,String>> searchExternalNaver(String searchKeyword);
}
