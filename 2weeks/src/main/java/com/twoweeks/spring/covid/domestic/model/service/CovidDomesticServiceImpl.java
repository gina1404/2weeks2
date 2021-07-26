package com.twoweeks.spring.covid.domestic.model.service;

import java.net.URI;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.twoweeks.spring.covid.domestic.model.vo.Response;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
@Service
public class CovidDomesticServiceImpl implements CovidDomesticService {

	@Override
	public ResponseEntity<String> getApi() {
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		System.out.println(date.format(today));
		String realtoday = date.format(today);
		String url = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?serviceKey=sklG4ffg0dLw22C3ideuBi5dyS%2FqK5%2F6YymY5LMR9PiSQhzt3w8aqVAwqS70rOvlGVGl7MctP%2BWC1OMzPgjmUA%3D%3D&pageNo=1&numOfRows=10&startCreateDt=20210721&endCreateDt="+realtoday;
		
		RestTemplate restTemplate = new RestTemplate(); //API를 호출하기 위한 클래스
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_XML);
		HttpEntity<HttpHeaders> entity = new HttpEntity<>(headers);
		
		ResponseEntity<String> response = restTemplate.exchange(URI.create(url), HttpMethod.GET, entity, String.class);
		
		return response;
	}

	@Override
	public Response parser(String xml) {
		ObjectMapper xmlMapper = new XmlMapper();
		Response response = null;
		try {
			response= xmlMapper.readValue(xml, Response.class);
		}catch(JsonMappingException e) {
			e.printStackTrace();
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return response;
	}

	
}
