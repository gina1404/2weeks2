package com.twoweeks.spring.covid.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


@Controller
public class CovidUpdateRegionalKorController {
	
	
	//코로나 지역별 현황(한국) 데이터를 받아다가 DB에 저장
	public void insertCovidRegionalKor() {
		//공공데이터포털에서 한국 데이터를 받아서 ListMap에 저장
		
		//ListMap을 보내서 DB에 저장		
		int result=0;
		System.out.println(result>0?"성공":"실패");
	}
	
	
	//tag값의 정보를 가져옴
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}

	@RequestMapping("/covidUpdate/Regional/Kor.do")
	public static void getRegionalKor(String[] args) {
		try {
			//파싱할 url
			String url="http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson?serviceKey=";
			String apiKey="G1aI%2FRRfjyDQsFrkf3dwyLdPOW6tiwkl%2FWxxTDyk0yVpFkv4AO9d5ZSTRbZDIfMp147xGvaXbxyLaaTlDw5iLw%3D%3D";
			url+=apiKey;
			
			//Document 객체 생성 - 파싱할 url 요소를 읽어옴
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc=dBuilder.parse(url);
			
			// root tag 
			doc.getDocumentElement().normalize(); 
			System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
			
			
			//파싱할 tag
			NodeList nList = doc.getElementsByTagName("item"); //items 태그의 내용을 가져옴
			//System.out.println("파싱할 리스트 수 : "+ nList.getLength());
			
			System.out.println("----------------------------");
			
			//가져온 데이터를 List에 넣기
			List<Map<String, String>> list = new ArrayList<>();			
			for(int temp = 0; temp < nList.getLength(); temp++){
				Map<String, String> map = new HashMap<>();
				Node nNode = nList.item(temp);
				
				//넣기
				if(nNode.getNodeType() == Node.ELEMENT_NODE){					
					Element eElement = (Element) nNode;
					map.put("stdDay", getTagValue("stdDay", eElement)); //기준일시
					map.put("gubun", getTagValue("gubun", eElement));
					map.put("gubunEn", getTagValue("gubunEn", eElement));
					map.put("defCnt", getTagValue("defCnt", eElement));
					map.put("incDec", getTagValue("incDec", eElement));
//					System.out.println("######################");
//					System.out.println("기준일시  : " + getTagValue("stdDay", eElement));
//					System.out.println("시도명  : " + getTagValue("gubun", eElement));
//					System.out.println("시도명(영문) : " + getTagValue("gubunEn", eElement));
//					System.out.println("확진자 수  : " + getTagValue("defCnt", eElement));
//					System.out.println("전일대비 증감 수  : " + getTagValue("incDec", eElement));
					list.add(map);
				}// for end
			}// if end
		}catch(Exception e) {
			e.printStackTrace();
		} //try-catch end
	} //main end	
} //class end
