package com.oracle.ohTravel.pkage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.ohTravel.city.model.CityDTO;
import com.oracle.ohTravel.city.service.CityService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/pkage")
public class PkageController {
	@Autowired
	private CityService cityService;
	
	@GetMapping("/detail")
	public String detail() {
		return "pkage/package_detail";
	}
	
	@GetMapping("/reservation")
	public String reservation() {
		return "pkage/package_reservation";
	}
	
	// 해외 search 페이지
	@GetMapping("/search01")
	public String search01(Model model) {
		log.info("PkageController search01() start..."); 
		// 출발지 선택 city 가져오기 (한국 출발지만 필요하기에 100으로 가져옴)
		List<CityDTO> cityList = cityService.selectCityByCountryId(100);
		
		model.addAttribute("cityList", cityList);
		log.info("PkageController search01() end..."); 
		return "pkage/package_search01";
	}
	
	// 국내 search 페이지
	@GetMapping("/search02")
	public String search02() {
		return "pkage/package_search02";
	}
}
