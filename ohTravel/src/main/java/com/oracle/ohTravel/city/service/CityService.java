package com.oracle.ohTravel.city.service;

import java.util.List;

import com.oracle.ohTravel.city.model.CityDTO;

public interface CityService {
	List<CityDTO> selectCityByCountryId(Integer country_id);
}
