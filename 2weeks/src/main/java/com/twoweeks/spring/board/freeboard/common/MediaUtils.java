package com.twoweeks.spring.board.freeboard.common;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {

	private static Map<String, MediaType> mediaMap;
	
	//mediaMap에 이미지 확장자명에 따른 MINETYPE 저장
	
	static {
		mediaMap = new HashMap<String, MediaType>();
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	public static MediaType getMediaType(String type) {
		//이미지 MINEType 꺼내서 반환, 이미지 파일이 아닐 경우 null 반환
		return mediaMap.get(type.toUpperCase());
	}
}
