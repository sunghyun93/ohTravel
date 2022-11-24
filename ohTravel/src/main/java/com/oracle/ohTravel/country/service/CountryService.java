package com.oracle.ohTravel.country.service;

import java.util.List;

import com.oracle.ohTravel.country.model.CountryDTO;

public interface CountryService {
	List<CountryDTO> selectCountryByCountryId(Integer country_id);
}
