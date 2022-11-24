package com.oracle.ohTravel.city.dao;

import java.util.List;

import com.oracle.ohTravel.city.model.CityDTO;

public interface CityDao {
	List<CityDTO> selectCityByCountryId(Integer country_id);
}
