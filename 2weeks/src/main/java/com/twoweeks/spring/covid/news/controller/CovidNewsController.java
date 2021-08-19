package com.twoweeks.spring.covid.news.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.covid.news.model.service.CovidNewsService;
import com.twoweeks.spring.covid.news.model.vo.CovidNews;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CovidNewsController {
	
	private  static final String CONNECT_URL ="https://www.ytn.co.kr/issue/corona.php";
	
	@Autowired
	private CovidNewsService service;
	
	
	
	
	public ModelAndView newsList(ModelAndView mv) throws Exception {
		int result=0;
		CovidNews cn =  null;
		Document document = Jsoup.connect(CONNECT_URL).get();
		Elements content = null;
		Elements links = null;
		Elements title = null;
		Elements newsDate = null;
		for(int i=1; i<15; i++) {
			 cn = new CovidNews();
			content = document.select("#zone1 > div.newslist_wrap > div:nth-child(1) > ul > li:nth-child("+i+") > a > div > div > span.desc");
			title = document.select("#zone1 > div.newslist_wrap > div:nth-child(1) > ul > li:nth-child("+i+") > a > div > span");
			//url주소 select태그
			links = document.select("#zone1 > div.newslist_wrap > div:nth-child(1) > ul > li:nth-child("+i+") > a");
			newsDate = document.select("#zone1 > div.newslist_wrap > div:nth-child(1) > ul > li:nth-child("+i+") > a > div > div > span.date");
			//forEach문으로 해당웹사이트의 해당하는select태그 수 만큼 반복하면서 src에 주소값을 넣어주고
			for(Element link : links) {
				String src = link.absUrl("href");
				//주소값이 있다면 cn객체의 url에 주소값들을 넣어주고, list에 추가해준다.
				if(!src.equals("")) {
					cn.setUrl(src);
					
				}
			}
			cn.setNewsDate(newsDate.text());
			cn.setTitle(title.text());
			cn.setContent(content.text());
			
			
			
			
			
			  Map<String, String> param = new HashMap<String, String>();
			  param.put("content", cn.getContent()); param.put("url", cn.getUrl()); param.put("title", cn.getTitle());  param.put("newsDate", cn.getNewsDate());
			  service.covidNewsData(param);
			 
			 
		}
		
		 
			 	
			mv.addObject("loc","/");
			mv.setViewName("news/covidNews");
			return mv;
	}
	
	@RequestMapping("covid/news")
	public String moveCovidNews() {
		return ("news/covidNews");
		
	}
	
}
