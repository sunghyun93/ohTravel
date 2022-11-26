package com.oracle.ohTravel.city.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.oracle.ohTravel.city.dao.CityDao;
import com.oracle.ohTravel.city.model.CityDTO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@EnableTransactionManagement
public class CityServiceImpl implements CityService {
	@Autowired
	private CityDao cityDao;
	
	@Override
	public List<CityDTO> selectCityByCountryId(Integer country_id) throws Exception {
		log.info("CityServiceImpl selectCity() start...");
		List<CityDTO> list = cityDao.selectCityByCountryId(country_id);
		log.info("CityServiceImpl selectCity() end...");
		return list;
	}
}
