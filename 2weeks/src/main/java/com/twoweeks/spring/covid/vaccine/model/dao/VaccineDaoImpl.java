package com.twoweeks.spring.covid.vaccine.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.twoweeks.spring.covid.vaccine.model.vo.Vaccine;


@Repository
public class VaccineDaoImpl implements VaccineDao {


	@Override
	public List<Vaccine> domesticVaccineList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("domesticVaccine.domesticVaccineList");
	}

	
	
}
