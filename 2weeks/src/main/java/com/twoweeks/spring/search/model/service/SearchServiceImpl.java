package com.twoweeks.spring.search.model.service;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.search.model.dao.SearchDao;

@Service
public class SearchServiceImpl implements SearchService{

	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private SearchDao dao;

	
	//네이버 api 검색
	@Override
	public ModelAndView searchExternalNaver(String searchKeyword) {
		//json 형식으로 된 api 데이터를 받아옴
			String clientId = "NwVLEfLT_EOPpqU895co"; //내 client ID
			String clientSecret = "OTOx_LnRfO"; //내 client secret
				
	        try {
	        	searchKeyword = URLEncoder.encode(searchKeyword, "UTF-8");	        	
	        } catch (UnsupportedEncodingException e) {
	            throw new RuntimeException("검색어 인코딩 실패",e);
	        }
	        
	        String apiURL="https://openapi.naver.com/v1/search/blog?query=" + searchKeyword; // json 결과
	        
	        Map<String, String> requestHeaders = new HashMap<>();
	        requestHeaders.put("X-Naver-Client-Id", clientId);
	        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	        
	        //데이터 파싱
	        String responseBody = get(apiURL,requestHeaders);
	        System.out.println(responseBody);
		        
		return null;
	}	
	private static String get(String apiUrl, Map<String, String> requestHeaders){ //네이버 검색용
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }
    private static HttpURLConnection connect(String apiUrl){ //네이버 검색용
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }
    private static String readBody(InputStream body){ //네이버 검색용
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
    
    
}