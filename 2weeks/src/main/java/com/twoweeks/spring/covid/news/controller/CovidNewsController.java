package com.twoweeks.spring.covid.news.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.twoweeks.spring.common.PageFactory;
import com.twoweeks.spring.covid.news.model.service.CovidNewsService;
import com.twoweeks.spring.covid.news.model.vo.CovidNews;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CovidNewsController {
	
	private  static final String CONNECT_URL ="https://www.ytn.co.kr/issue/corona.php";
	
	@Autowired
	private CovidNewsService service;
	
	
	
	@Scheduled(cron = "0 0 12 * * *")
	public void newsList() throws Exception {
		ModelAndView mv = new ModelAndView();
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

			//				String src1 = image.attr("src");
			//				log.info(src1);
			//				URL url = new URL(src1);
			//				HttpURLConnection conn=(HttpURLConnection)url.openConnection();
			//				conn.setRequestProperty("Referer", src1);
			//				BufferedImage jpg = ImageIO.read(conn.getInputStream());
			//resources/upload 경로 설정하여 path에 저장
			//FileOutputStream out = new FileOutputStream("C:\\Users\\BurgerBum\\git\\2weeks2\\2weeks\\src\\main\\webapp\\resources\\upload\\"+src1);
			//ImageIO.write(jpg, "jpg", out);


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

	}
	
	@RequestMapping("covid/news.do")
	public ModelAndView moveCovidNews(ModelAndView mv, @RequestParam(value="cPage", defaultValue="1") int cPage, @RequestParam(value="numPerpage",defaultValue="6")int numPerpage) {
		 mv.addObject("list",service.list(cPage, numPerpage));
		 int totalData = service.totalNewsCount();
		 mv.addObject("totalContents",totalData);
		 mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, "news.do"));
		 mv.setViewName("news/covidNews");
		return mv;
		
	}
	
	@GetMapping("news/getNewsList")
	public ResponseEntity<List<CovidNews>> getNewsList() {
		log.info("new 리스트 가져오기!!");
		ResponseEntity<List<CovidNews>> entity = null;
		try {
			entity = new ResponseEntity<List<CovidNews>>(service.getNewsList(), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<CovidNews>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		 
	}
}
