package com.oracle.ohTravel.pkage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.ohTravel.city.model.CityDTO;
import com.oracle.ohTravel.city.service.CityService;
import com.oracle.ohTravel.pkage.model.PkageDTORM;
import com.oracle.ohTravel.pkage.model.PkgSearch;
import com.oracle.ohTravel.pkage.service.PkageService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/pkageRest")
@Slf4j
public class PkageRestController {
	@Autowired
	private CityService cityService;
	@Autowired 
	private PkageService pkageService;
	
	@PostMapping("/selectCity")
	public ResponseEntity<List<CityDTO>> selectCity(Integer country_id) {
		log.info("PkageRestController selectCity() start...");
		List<CityDTO> list = null;
		
		try {
			list = cityService.selectCityByCountryId(country_id);
			
			log.info("PkageRestController selectCity() end...");
			return new ResponseEntity<List<CityDTO>>(list, HttpStatus.OK); // 200
		} catch(Exception e) {
			e.printStackTrace();
			log.info("PkageRestController selectCity() end...");
			return new ResponseEntity<List<CityDTO>>(HttpStatus.INTERNAL_SERVER_ERROR); // 500
		}
	}
	
	// 테스트용
	@GetMapping("/test")
	public List<PkageDTORM> test() {
		try {
			PkgSearch pkgSearch = new PkgSearch();
			pkgSearch.setPkage_gubun(1);
			pkgSearch.setToDesti(310);
			pkgSearch.setDates_start_check("2022-12-21");
			
			Map<String, Object> map = new HashMap<>();
			map.put("toDesti", pkgSearch.getToDesti());
			map.put("dates_start_check", pkgSearch.getDates_start_check());
			map.put("order", 3); // pkage_soldCnt(1), pkage_score(2), pkage_dt_Aprice(3,4)
			
			List<PkageDTORM> list = pkageService.selectPkgWithDetailAndFlight(map);
			return list;
		} catch(Exception e) {

		}
		return null;
	}
}
