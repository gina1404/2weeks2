package com.twoweeks.spring.covid.vaccine.model.vo;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

	import lombok.Data;

	@Data
	@JsonIgnoreProperties(ignoreUnknown = true)
	public class Body {

	    private List<Item> items;
		private int page;
		private int perPage;
		private int currentCount;
	    @JsonProperty("totalCount")
	    private int totalCount;
	
	
	}
	
