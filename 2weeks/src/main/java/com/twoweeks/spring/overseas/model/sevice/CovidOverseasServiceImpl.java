package com.twoweeks.spring.overseas.model.sevice;

import java.net.URI;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.twoweeks.spring.overseas.model.dao.CoivdOverseasDao;
import com.twoweeks.spring.overseas.model.vo.OverseasGr;
import com.twoweeks.spring.overseas.model.vo.Response;

@Service
public class CovidOverseasServiceImpl implements CovidOverseasService{
	
	@Autowired
	private CoivdOverseasDao dao;
	@Autowired
	private SqlSession session;

	@Override
	public ResponseEntity<String> getApi() {
		// TODO Auto-generated method stub
		
		/*
		 * Date today = new Date(); SimpleDateFormat date = new
		 * SimpleDateFormat("yyyyMMdd"); System.out.println(date.format(today)); String
		 * realtoday = date.format(today);
		 */
		Calendar c1 = new GregorianCalendar();

		c1.add(Calendar.DATE, -1); // 오늘날짜로부터 -1

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); // 날짜 포맷 
		String realtoday = sdf.format(c1.getTime()); // String으로 저장
		
		String ex="20210731";
		
		String url = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19NatInfStateJson?serviceKey=9pnmHJmbkUpNSmMy%2FGw4uRkhWrEvJq1AIuZmpisXpZ2On4uPUVtQgWKq%2FNYBzMEccRQJLCmov7%2Brh%2BAbJQ4eyg%3D%3D&pageNo=1&numOfRows=10&startCreateDt="+realtoday+"&endCreateDt="+realtoday;
		//String url = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19NatInfStateJson?serviceKey=9pnmHJmbkUpNSmMy%2FGw4uRkhWrEvJq1AIuZmpisXpZ2On4uPUVtQgWKq%2FNYBzMEccRQJLCmov7%2Brh%2BAbJQ4eyg%3D%3D&pageNo=1&numOfRows=10&startCreateDt="+ex+"&endCreateDt="+ex;
		
		RestTemplate restTemplate = new RestTemplate(); //API를 호출하기 위한 클래스
		
		HttpHeaders headers = new HttpHeaders();
		
		/* rest템플릿에대한 응답을 받을떄 인코딩 값 넣기 */
		restTemplate.getMessageConverters()
		        .add(0, new StringHttpMessageConverter(StandardCharsets.UTF_8));
		

		
		
		HttpEntity<HttpHeaders> entity = new HttpEntity<>(headers);
		//entity.getHeaders().setContentType(MediaType.APPLICATION_XML);
		
		
		
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
	public int insertGrData(OverseasGr gg) {
		// TODO Auto-generated method stub
		return dao.insertGrData(session,gg);
		
	}


	@Override
	public OverseasGr selectydayDef() {
		// TODO Auto-generated method stub
		return dao.selectydayDef(session);
	}


	@Override
	public List<OverseasGr> selectGrList() {
		// TODO Auto-generated method stub
		return dao.selectGrList(session);
	}


	@Override
	public int updateGrData(OverseasGr gg2) {
		// TODO Auto-generated method stub
		return dao.updateGrData(session,gg2);
	}



	
	
}
