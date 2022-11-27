package com.oracle.ohTravel.pkage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.ohTravel.city.model.CityDTO;
import com.oracle.ohTravel.city.service.CityService;
import com.oracle.ohTravel.country.model.CountryDTO;
import com.oracle.ohTravel.country.service.CountryService;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.pkage.service.PkageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/pkage")
public class PkageController {
	@Autowired
	private CityService cityService;
	@Autowired
	private CountryService countryService;
	@Autowired
	private PkageService pkageService;
	
	@GetMapping("/detail")
	public String detail() {
		return "pkage/package_detail";
	}
	
	@GetMapping("/reservation")
	public String reservation() {
		return "pkage/package_reservation";
	}
	
	// 귝내/해외 search 페이지(0:국내 1:해외)
	@GetMapping("/search/{gubun}")
	public String search01(@PathVariable("gubun")Integer gubun, Model model) {
		log.info("PkageController search01() start..."); 
		
		log.info("gubun = " + gubun);
		try {
			// 가고싶은 나라 country 모두 가져오기 (한국-100 빼고)
			List<CountryDTO> countryList = countryService.selectCountryByCountryId(100);
			
			// 출발지 선택 city 가져오기 (한국 출발지만 필요하기에 100으로 가져옴)
			List<CityDTO> cityList = cityService.selectCityByCountryId(100);
			
			// 해외 패키지 상품 판매순 / 평점순 6개 가져오기
			Map<String, Integer> map = new HashMap<>();
			map.put("pkage_gubun", gubun);
			map.put("row_count", 6);
			List<PkageDTO> pkageList = pkageService.selectPkgBySoldScoreOrder(map);
			
			// 해외 패키지 상품 지정 테마 판매순 / 평점순  6개 가져오기
			Map<String, Object> map2 = new HashMap<>();
			map2.put("thema", "힐링");
			map2.put("pkage_gubun", gubun);
			map2.put("row_count", 6);
			List<PkageDTO> pkageListThema = pkageService.selectPkgByThemaSoldScoreOrder(map2);
			
			model.addAttribute("countryList", countryList);
			model.addAttribute("cityList", cityList);
			model.addAttribute("pkageList", pkageList);
			model.addAttribute("pkageListThema", pkageListThema);
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		log.info("PkageController search01() end..."); 
		return "pkage/package_search01";
	}
	

}
