package com.twoweeks.spring.covid.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.twoweeks.spring.covid.model.dao.CovidUpdateRegionalKorDao;
import com.twoweeks.spring.covid.model.vo.CovidRegionalKorData;

@Service
public class CovidUpdateRegionalKorServiceImpl implements CovidUpdateRegionalKorService{
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private CovidUpdateRegionalKorDao dao;
	
	//tag값의 정보를 가져옴
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}

	//공공데이터포털에서 한국 데이터를 받아서 List<CovidRegionalKorData>에 저장
	@Override
	public List<Map<String,String>> getCovidRegionalKorData() {
		List<Map<String, String>> list = new ArrayList<>();	//값을 담을 list 생성	
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
			System.out.println("지역별 현황 데이터 가져오기 : " + doc.getDocumentElement().getNodeName());
			
			
			//파싱할 tag
			NodeList nList = doc.getElementsByTagName("item"); //items 태그의 내용을 가져옴
			//System.out.println("파싱할 리스트 수 : "+ nList.getLength());
			
			System.out.println("----------------------------");
			
			//가져온 데이터를 List에 넣기	
			for(int temp = 0; temp < nList.getLength(); temp++){
				Map<String, String> map = new HashMap<>();
				Node nNode = nList.item(temp);				
				//넣기
				if(nNode.getNodeType() == Node.ELEMENT_NODE){					
					Element eElement = (Element) nNode;
					map.put("stdDay", getTagValue("stdDay", eElement)); //기준일시
					map.put("gubun", getTagValue("gubun", eElement)); //시도명
					map.put("gubunEn", getTagValue("gubunEn", eElement)); //시도명(영문)
					map.put("defCnt", getTagValue("defCnt", eElement)); //확진자 수
					map.put("incDec", getTagValue("incDec", eElement)); //전일대비 증감 수
					list.add(map);
				}// for end
			}// if end
		}catch(Exception e) {
			e.printStackTrace();
		} //try-catch end
		if(!list.isEmpty()) {
			return list; //list에 값이 있으면 반환			
		}else {
			return null; //아니면 null 반환	
		}
	}

	//map을 보내서 DB에 저장	
	@Override
	public int updateCovidRegionalKorData(Map<String, String> map) {
		return dao.updateCovidRegionalKorData(session, map);
	}

	//DB에 저장된 데이터를 조회해옴
	@Override
	public List<CovidRegionalKorData> selectCovidRegionalKorList() {
		return dao.selectCovidRegionalKorList(session);
	}

	
	
	
}
