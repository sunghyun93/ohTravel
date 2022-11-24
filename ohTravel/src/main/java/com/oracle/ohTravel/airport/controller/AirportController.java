package com.oracle.ohTravel.airport.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.ohTravel.city.model.CityDTO;
import com.oracle.ohTravel.city.service.CityService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/airport")
@Slf4j
public class AirportController {
	
	private final CityService cityService;
	
	//항공권 검색
	@RequestMapping(value = "/searchTicket")
	public String searchTicket(Model model) {
		log.info("AirportController searchTicket");
		List<CityDTO> cityList = cityService.selectCityByCountryId(100);
		model.addAttribute("cityList",cityList);
		
		
		return "airport/searchTicket";
	}
	
	//항공권 예약
	@RequestMapping(value = "/air_reservation")
	public String air_reservation() {
		return "airport/air_reservation";
	}
	
	
	
}
