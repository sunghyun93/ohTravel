package com.oracle.ohTravel.country.dao;

import java.util.List;

import com.oracle.ohTravel.country.model.CountryDTO;

public interface CountryDao {
	List<CountryDTO> selectCountryByCountryId(Integer country_id);
}
