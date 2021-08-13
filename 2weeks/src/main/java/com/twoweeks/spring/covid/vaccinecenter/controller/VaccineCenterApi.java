package com.twoweeks.spring.covid.vaccinecenter.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class VaccineCenterApi {
	
//	@GetMapping("vaccine/vaccineCenter")
//	public String vaccineCenter() {
//		return "vaccinecenter/vaccineCenter";
//	}
	
	
	@GetMapping("vaccine/vaccineCenter")

	public String getCenter(Model model) throws IOException, ParseException{
	
		StringBuilder urlBuilder = new StringBuilder("http://api.odcloud.kr/api/15077586/v1/centers");
		
		urlBuilder.append("?"+URLEncoder.encode("serviceKey","UTF-8") + "=VPYrH%2BhlvX%2F9SI46YCr2bTHAcePLGISH81LEGHjOIeSgBXljwBop5FGGWM33MhrsIwmf8gVQvrdVOWvkvKx2UQ%3D%3D");
		urlBuilder.append("&"+URLEncoder.encode("returnType","UTF-8") + "=" +URLEncoder.encode("JSON", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("perPage","UTF-8") + "=" + URLEncoder.encode("500", "UTF-8")); 
        urlBuilder.append("&" + URLEncoder.encode("page","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); 
        
        URL url = new URL(urlBuilder.toString());
        System.out.println(url);
        
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        log.info("Response Code ={}",conn.getResponseCode());
        
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }  
            rd.close();
            conn.disconnect();
            
            //System.out.println("sb.toString()" +sb.toString());
            //문자열 형태의 JSON을 파싱하기 위한 JSONParser 객체 생성.
            JSONParser parser = new JSONParser();
            //문자열을 JSON 형태로 JSONObject 객체에 저장. 	
            JSONObject obj = (JSONObject)parser.parse(sb.toString());
            //System.out.println("obj" + obj);
            //필요한 리스트 데이터 부분만 가져와 JSONArray로 저장.
            JSONArray dataArr = (JSONArray) obj.get("data");
            //System.out.println("dataArr========================================="+dataArr);
            model.addAttribute("data",dataArr);
            return "vaccinecenter/vaccineCenter";
        
        
	}
}