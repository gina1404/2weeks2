package com.twoweeks.spring.covid.domestic.model.Service;

import java.net.URI;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.google.gson.Gson;
import com.twoweeks.spring.covid.domestic.model.vo.Response;

import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
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

	//OPxjpH9NsZcbai7EGVg5KSFrYJd4Cw6RM
		@Override
		public String getGoodBye() {
			String url = "https://api.corona-19.kr/korea/?serviceKey=OPxjpH9NsZcbai7EGVg5KSFrYJd4Cw6RM"; //국내 카운터
			String url2 = "https://api.corona-19.kr/korea/country/new/?serviceKey=OPxjpH9NsZcbai7EGVg5KSFrYJd4Cw6RM"; //시도별 발생동향  신규 확진자수가 있음
			ObjectMapper mapper = new ObjectMapper();
			
			RestTemplate restTemplate = new RestTemplate();
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			HttpEntity<HttpHeaders> entity = new HttpEntity<>(headers);
			
			String json="";
			try {
				json = mapper.writeValueAsString(restTemplate.exchange(URI.create(url2), HttpMethod.GET,entity,String.class).getBody());
				return new Gson().fromJson(json, String.class);
			} catch (JsonProcessingException | RestClientException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
			
			//ResponseEntity<String> response = restTemplate.exchange(URI.create(url2), HttpMethod.GET, entity, String.class);
			
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