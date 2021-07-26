package com.twoweeks.spring.covid.domestic.model.vo;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class Body {

	private List<Item> items;
	private int numOfRows;
	private int pageNo;
	@JsonProperty("toatalCount")
	private int toatalCount;
}
