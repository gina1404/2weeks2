package com.twoweeks.spring.covid.vaccine.Service;

import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;

import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.twoweeks.spring.covid.vaccine.model.dao.VaccineDao;
import com.twoweeks.spring.covid.vaccine.model.vo.Response;
import com.twoweeks.spring.covid.vaccine.model.vo.Vaccine;






@Service
public class VaccineServiceImpl implements VaccineService {
	
	
	
	@Autowired
	private VaccineDao dao;
	@Autowired
	private SqlSession session;
    @Override
    public ResponseEntity<String> getApi() {
    	Calendar c1 = new GregorianCalendar();

		c1.add(Calendar.DATE, -1); // 오늘날짜로부터 -1

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 포맷 
		String realtoday = sdf.format(c1.getTime()); // String으로 저장
		
		String ex="20210819";
		
		 String url = "https://api.odcloud.kr/api/15077756/v1/vaccine-stat?page=1&perPage=10&returnType=XML&cond%5BbaseDate%3A%3AEQ%5D="+ex+"&serviceKey=data-portal-test-key";
		
		RestTemplate restTemplate = new RestTemplate(); //API를 호출하기 위한 클래스
		
		HttpHeaders headers = new HttpHeaders();
		
		/* rest템플릿에대한 응답을 받을떄 인코딩 값 넣기 */
		restTemplate.getMessageConverters()
		        .add(0, new StringHttpMessageConverter(StandardCharsets.UTF_8));
		

		
		
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
	
	@Override
	public List<Vaccine> domesticVaccineList() {
		// TODO Auto-generated method stub
		return dao.domesticVaccineList(session);
	}
}
