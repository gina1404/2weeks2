package com.twoweeks.spring.overseas.model.sevice;




import java.util.List;

import org.springframework.http.ResponseEntity;

import com.twoweeks.spring.overseas.model.vo.Item;
import com.twoweeks.spring.overseas.model.vo.OverseasGr;
import com.twoweeks.spring.overseas.model.vo.Response;

public interface CovidOverseasService {

	ResponseEntity<String> getApi();
	Response parser(String xml);
	int insertGrData(OverseasGr gg);
	OverseasGr selectydayDef();
	List<OverseasGr>selectGrList();
	int updateGrData(OverseasGr gg2);
	int insertOverseasList(List<Item>list);

}
