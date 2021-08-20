package com.twoweeks.spring.covid.vaccine.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.twoweeks.spring.covid.vaccine.model.vo.Vaccine;

public interface VaccineDao {

	List<Vaccine> domesticVaccineList(SqlSession session);

}
