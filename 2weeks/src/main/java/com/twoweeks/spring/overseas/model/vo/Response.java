package com.twoweeks.spring.overseas.model.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
public class Response {

	private Header header;
	private Body body;
}
