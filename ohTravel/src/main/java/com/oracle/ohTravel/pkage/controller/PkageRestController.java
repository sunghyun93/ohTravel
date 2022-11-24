package com.oracle.ohTravel.pkage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.ohTravel.city.model.CityDTO;
import com.oracle.ohTravel.city.service.CityService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/pkageRest")
@Slf4j
public class PkageRestController {
	@Autowired
	private CityService cityService;
	
	@PostMapping("/selectCity")
	public List<CityDTO> selectCity(Integer country_id) {
		log.info("PkageRestController selectCity() start...");
		List<CityDTO> list = cityService.selectCityByCountryId(country_id);
		log.info("PkageRestController selectCity() end...");
		return list;
	}
}
