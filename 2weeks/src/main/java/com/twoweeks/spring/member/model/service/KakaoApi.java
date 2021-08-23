package com.twoweeks.spring.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class KakaoApi {

	//인증코드로 AccessToken받기
	public String getAccessToken(String authorize_code) {
		String access_Token="";
		String refresh_Token="";
		String requestURL="https://kauth.kakao.com/oauth/token";
		
		try {
			URL url = new URL(requestURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			//Post요청을 위해 기본값이 false인 setDoOutput을 true로 설정
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			//Post요청에 필요로 요구하는 파라미터를 스트림으로 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=7b4b21f6e600d0bd834e6900c63c7084");
			sb.append("&redirect_uri=http://http://rclass.iptime.org:9999/spring/member/kakaoLogin"); 
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
			
			//결과코드 200이면 성공
			int responseCode = conn.getResponseCode();
			log.info("responseCode= 200 or 400 ={}",responseCode);
			
			//Response메세지 읽어오기 (JSON)
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line ="";
			String result="";
			
			while ((line = br.readLine()) != null) {
				result += line;
			}
			log.info("response body : ={} "+ result);
			
			//Gson으로 Json파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
			
			log.info("access_token ={} ", access_Token);
			log.info("refresh_token={} " , refresh_Token);
			
			br.close();
			bw.close();

		}catch(IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}
	
	////유저정보에 email정보가 있을때 세션에 토큰과 이메일 등록
	public HashMap<String, Object> getUserInfo(String access_Token){
		
		HashMap<String, Object> userInfo = new HashMap<>();
		
		String requestURL="https://kapi.kakao.com/v2/user/me"; 
						 
		try {
			URL url = new URL(requestURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			
			//요청에 필요한 Header 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
								     
			int responseCode = conn.getResponseCode();
			log.info("responseCode ={}", responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line ="";
			String result="";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			log.info("response body: ={}",result);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			String id = element.getAsJsonObject().get("id").getAsString();
			String nickname= properties.getAsJsonObject().get("nickname").getAsString();
			String email= kakao_account.getAsJsonObject().get("email").getAsString();
			
			log.info("id={}",id);
			log.info("nickname={}",nickname);
			log.info("email ={} ",email);
			
			userInfo.put("id", id);
			userInfo.put("nickname", nickname);
			userInfo.put("email",email);

		}catch(IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}
	
	//로그아웃
	public void kakaoLogout(String access_Token) {
		String requestURL = "https://kapi.kakao.com/v1/user/logout";
		try {
			URL url = new URL(requestURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			
			int responseCode = conn.getResponseCode();
			log.info("logout responseCode ={} ", responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String result="";
			String line = "";
			
			while((line = br.readLine()) != null) {
				result += line;		
			}
			log.info("result ={} ",result);
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
}
