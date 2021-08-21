package com.twoweeks.spring.covid.domestic.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Item {

	private int no;
	private double accDefRate; //누적 확진률
	private int accExamCnt; //누적 검사 수
	private int accExamCompCnt; // 누적 검사 완료 수
	private int careCnt; //치료중 환자 수
	private int clearCnt; //격리해제 수
	private String createDt; //등록일시분초
	private int deathCnt; //사망자 수
	private int decideCnt; //확진자 수
	private int examCnt; //검사진행 수
	private int resutlNegCnt; //결과 음성 수
	private int seq; // 게시글 번호
	private int stateDt; //기준일
	private String stateTime; //기준시간
	private String updateDt; //수정일시분초

}
