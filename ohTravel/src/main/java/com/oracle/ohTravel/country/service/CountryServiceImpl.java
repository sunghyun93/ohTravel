package com.oracle.ohTravel.country.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.ohTravel.country.dao.CountryDao;
import com.oracle.ohTravel.country.model.CountryDTO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CountryServiceImpl implements CountryService {
	@Autowired
	private CountryDao countryDao;
	
	public List<CountryDTO> selectCountryByCountryId(Integer country_id) {
		log.info("CountryServiceImpl selectCountryAll() start...");
		List<CountryDTO> list = countryDao.selectCountryByCountryId(country_id);
		log.info("CountryServiceImpl selectCountryAll() end...");
		return list;
	}
}
