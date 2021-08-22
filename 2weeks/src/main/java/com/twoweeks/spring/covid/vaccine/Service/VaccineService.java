package com.twoweeks.spring.covid.vaccine.Service;



import org.springframework.http.ResponseEntity;

import com.twoweeks.spring.covid.vaccine.model.vo.Response;

public interface VaccineService {
    ResponseEntity<String> getApi();
    Response parser(String xml);
	
}
