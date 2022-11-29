package com.oracle.ohTravel.country.service;

import java.util.List;

import com.oracle.ohTravel.country.model.CountryDTO;

public interface CountryService {
	List<CountryDTO> selectCountryByCountryId(Integer country_id) throws Exception;

	List<CountryDTO> selectCountryByCountryId2(Integer country_id) throws Exception;
	
	CountryDTO selectCountryByCityId(Integer city_id) throws Exception;
}
