package com.oracle.ohTravel.country.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.country.model.CountryDTO;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class CountryDaoImpl implements CountryDao {
	@Autowired
	private SqlSession session;
	
	private String namespace = "com.oracle.ohTravel.CountryMapper.";
	
	@Override
	public List<CountryDTO> selectCountryByCountryId(Integer country_id) {
		log.info("CountryDaoImpl selectCountryAll() start..."); 
		List<CountryDTO> list = session.selectList(namespace+"selectCountryByCountryId", country_id);
		log.info("CountryDaoImpl selectCountryAll() end..."); 
		return list;
	}
}
