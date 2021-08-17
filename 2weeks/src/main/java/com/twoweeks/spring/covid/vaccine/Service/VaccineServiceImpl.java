package com.twoweeks.spring.covid.vaccine.Service;

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
//import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.twoweeks.spring.covid.vaccine.model.vo.Response;

@Service
public class VaccineServiceImpl implements VaccineService {
    @Override
    public ResponseEntity<String> getApi() {
        Date today = new Date();
        SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
        System.out.println(date.format(today));
        String realtoday = date.format(today);
        String url = "http://api.odcloud.kr/api/15077756/v1/vaccine-stat?page=1&perPage=10&serviceKey=4HBmMYHV4LEzHhsavDRJeoaBZWAHBYegTZBYClOf6JZe51z431lufvFfGZFreiwMa5mCKyCbLTXhJYRZnb256w%3D%3D"+realtoday;
        
        RestTemplate restTemplate = new RestTemplate(); //API를 호출하기 위한 클래스
        
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_XML);
        HttpEntity<HttpHeaders> entity = new HttpEntity<>(headers);
        
        ResponseEntity<String> response = restTemplate.exchange(URI.create(url), HttpMethod.GET, entity, String.class);
        
        return response;
    }

    @Override
    public Response parser(String xml) {
//        ObjectMapper xmlMapper = new XmlMapper();
//        Response response = null;
//        try {
//            response= xmlMapper.readValue(xml, Response.class);
//        }catch(JsonMappingException e) {
//            e.printStackTrace();
//        }catch(JsonProcessingException e) {
//            e.printStackTrace();
//        }
        return null;
    }
}
