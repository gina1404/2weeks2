package com.twoweeks.spring.covid.vaccine.model.vo;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

	import lombok.Data;

	@Data
	@JsonIgnoreProperties(ignoreUnknown = true)
	public class Body {

	//	private int page;
	//	private int perPage;
	//	private int currentCount;
	//    @JsonProperty("totalCount")
	//   private int totalCount;
	    private List<Item> items;
	    private String dataTime;
	
	}

	
