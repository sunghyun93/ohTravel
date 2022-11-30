package com.oracle.ohTravel.country.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.country.model.CountryDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class CountryDaoImpl implements CountryDao {
	@Autowired
	private SqlSession session;
	
	private String namespace = "com.oracle.ohTravel.CountryMapper.";
	
//	country 입력받은 국가만 빼고 나머지 국가 가져오기
	@Override
	public List<CountryDTO> selectCountryByCountryId(Integer country_id) throws Exception {
		log.info("CountryDaoImpl selectCountryByCountryId() start..."); 
		List<CountryDTO> list = session.selectList(namespace+"selectCountryByCountryId", country_id);
		log.info("CountryDaoImpl selectCountryByCountryId() end..."); 
		return list;
	}

//	country 입력받은 한개의 국가만 가져오기
	@Override
	public List<CountryDTO> selectCountryByCountryId2(Integer country_id) throws Exception {
		log.info("CountryDaoImpl selectCountryByCountryId2() start..."); 
		List<CountryDTO> list = session.selectList(namespace+"selectCountryByCountryId2", country_id);
		log.info("CountryDaoImpl selectCountryByCountryId2() end..."); 
		return list;
	}
	
//	도시 ID를 통한 국가 가져오기
	@Override
	public CountryDTO selectCountryByCityId(Integer city_id) throws Exception {
		log.info("CountryDaoImpl selectCountryByCityId() start...");
		CountryDTO dto = session.selectOne(namespace+"selectCountryByCityId", city_id);
		log.info("CountryDaoImpl selectCountryByCityId() end...");
		return dto;
	}
}
