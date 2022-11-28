package com.oracle.ohTravel.city.model;

import com.oracle.ohTravel.country.model.CountryDTO;

import lombok.Data;

@Data
public class CityDTO {
	private Integer city_id;		// 도시ID
	private Integer country_id;		// 국가ID
	private String city_name;		// 도시 이름
	
	// country
	private CountryDTO countryDTO;	// 국가
}
