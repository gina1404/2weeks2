package com.twoweeks.spring.overseas.model.sevice;


import org.springframework.http.ResponseEntity;

import com.twoweeks.spring.overseas.model.vo.Response;

public interface CovidOverseasService {

	ResponseEntity<String> getApi();
	Response parser(String xml);
}
