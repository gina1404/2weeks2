package com.twoweeks.spring.search.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twoweeks.spring.search.model.dao.SearchDao;
import com.twoweeks.spring.search.model.vo.DummyData;

@Service
public class SearchServiceImpl implements SearchService{

	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private SearchDao dao;

	
	//네이버 api 검색
	@Override
	public List<Map<String,String>> searchExternalNaver(String searchKeyword){
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
	        
//	        System.out.println(get(apiURL,requestHeaders));        //값 받아오는지 확인
	        
	        //데이터 파싱
	        String responseBody = get(apiURL,requestHeaders);
	        JSONParser parser=new JSONParser();
	        JSONObject obj=null;
	        try {
	        	obj=(JSONObject)parser.parse(responseBody);
	        }catch(ParseException e) {
	        	e.printStackTrace();
	        }	        
	        JSONArray item=(JSONArray)obj.get("items");
	        
	        //파싱한 데이터를 리스트 맵에 담음
	        List<Map<String,String>> list = new ArrayList<>(); //값을 담을 list 생성
//	        List<SearchExternalNaver> list=new ArrayList<>(); //객체에 담는 것에서 map으로 바꿈
	        
	        for(int i=0; i<item.size(); i++) {
	        	Map<String, String> map = new HashMap<>();
//	        	SearchExternalNaver result=new SearchExternalNaver();
	        	JSONObject tmp=(JSONObject)item.get(i);
	        	map.put("postdate",(String)tmp.get("postdate"));
	        	map.put("title",(String)tmp.get("title"));
	        	map.put("link",(String)tmp.get("link"));
	        	map.put("description",(String)tmp.get("description"));
	        	map.put("bloggername",(String)tmp.get("bloggername"));
	        	map.put("bloggerlink",(String)tmp.get("bloggerlink"));
	        	list.add(map);
	        	
	        	//객체에 담는 것에서 map으로 바꿈
//	        	try { //Object->Date 변환
//	        		String postdate=(String)tmp.get("postdate"); 
//		        	SimpleDateFormat formatter=new SimpleDateFormat("yyyyMMdd");
//		        	Date date=formatter.parse(postdate);
//		        	result.setPostdate(date);
//	        	}catch(Exception e) {
//	        		e.printStackTrace();
//	        	}
//	        	result.setTitle((String)tmp.get("title"));
//	        	result.setLink((String)tmp.get("link"));
//	        	result.setDescription((String)tmp.get("description"));
//	        	result.setBloggername((String)tmp.get("bloggername"));
//	        	result.setBloggerlink((String)tmp.get("bloggerlink"));
//	        	list.add(result);
	        }	        
		return list;
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

   //다음 블로그 크롤링
    @Override
	public List<DummyData> getBlogDummy(String searchKeyword) {
    	List<DummyData> list = new ArrayList<>(); //값을 담을 list 생성
    	
    	try {
//    		for(int i=0; i<=10; i++) { //페이지 반복
    			String daumblogUrl="https://search.daum.net/search?w=blog&nil_search=btn&DA=NTB&enc=utf8&q="+searchKeyword; //+"&p="+i;
    			Document doc=Jsoup.connect(daumblogUrl).get();
    			Elements elem=doc.select("div.coll_cont ul li div.wrap_cont div.cont_inner");
    			
    			
    					
    			//데이터 전처리
    			for(Element e : elem) {			
    				String title=e.select("a.f_link_b").text();//제목
    				String link=e.select("a.f_link_b").attr("href"); //게시글 링크		
    				String content; //미리보기
    				String update; //게시일	
    				String writer; //작성자
    							
    				Document doc2=Jsoup.connect(link).get(); //원문 가져오기
    				writer=doc2.select("span.author").text();
    				update=doc2.select("span.date").text();
    				content=doc2.select(".tt_article_useless_p_margin").text();
    				
    				//값을 가져올 수 없는 경우
    				if(content.isBlank()) content=e.select("p.f_eb.desc").text(); //미리보기로 대체
    				if(update.isBlank()) update=e.select("span.f_nb.date").text();
    				if(writer.isBlank()) writer="unknown";
    				
    				//writer 데이터 정제
    				if(writer.contains("by")) writer=writer.substring(3);
    				if(writer.contains(" ")) writer=writer.substring(0, writer.lastIndexOf(" "));
    				if(update.contains(":")) update=update.substring(0, update.indexOf(":")-4);
    				
    				//날짜 변환
    				if(update.contains("전")||update.contains("어제")) update="0000.00.00";
    				
    				//content 길이 자르기 -> 이거 이어서 해야 됨**********************************************
    				if(content.getBytes().length>2000) content.substring(0,600);
    				
    				//데이터 확인용
//    				System.out.println(title);
//    				System.out.println(content);
//    				System.out.println(newdate);
//    				System.out.println(writer);
//    				System.out.println("===============================");
    				
    				//데이터 저장
    				DummyData dd=new DummyData();
    					//게시글 번호는 sql default로 처리할 것
    				dd.setUserId("dummy"); //작성자ID
    				dd.setMenuGB("COVID"); //게시판 종류
    				dd.setCategory("COVID"); //카테고리 글 분류
    				dd.setPostTitle(title); //제목
    				dd.setPostContent(content); //본문
    					//공유 설정은 default값 사용
    					//좋아요도 default 사용
    				dd.setPostDT(update); //작성일 		
    				
    				list.add(dd);
    			} //데이터 전처리 종료
//    		} //페이지 반복문 종료
    	}catch(Exception e){
    		e.printStackTrace();
    	}    	
		return list;
	}
    
    //다음 블로그 크롤링 데이터 저장
	@Override
	public int insertBlogDummy(DummyData dd) {
		return dao.insertBlogDummy(session, dd);
	}
    
    
    
}