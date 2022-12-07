package com.oracle.ohTravel.pkage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.ohTravel.city.model.CityDTO;
import com.oracle.ohTravel.city.service.CityService;
import com.oracle.ohTravel.member.model.MemberDTO;
import com.oracle.ohTravel.pkage.dao.PkageDao;
import com.oracle.ohTravel.pkage.model.PkageDTORM;
import com.oracle.ohTravel.pkage.model.Pkage_detailDTO;
import com.oracle.ohTravel.pkage.model.Pkage_flightScheDTO;
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
	@Autowired
	private PkageDao pkageDao;
	
	// 패키지 검색부분의 나라에 따른 도시 보내는 메서드
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
	
	// 로그인 체크 용
	@GetMapping("/loginCheck")
	public ResponseEntity<String> loginCheck(HttpSession session) {
		log.info("PkageRestController loginCheck() start");
		boolean loginCheck = session.getAttribute("member") == null; 
		if(session.getAttribute("res") != null)
			log.info("로그인ID="+((MemberDTO)session.getAttribute("member")).getMem_id());
		if(!loginCheck) {
			log.info("PkageRestController loginCheck() end");
			return new ResponseEntity<String>("LOGIN_OK", HttpStatus.OK);
		} else {
			log.info("PkageRestController loginCheck() end");
			return new ResponseEntity<String>("LOGIN_NO", HttpStatus.OK);
		}
	}
	
	// 테스트용
	@GetMapping("/test")
	public List<PkageDTORM> test() {
		try {
			PkgSearch pkgSearch = new PkgSearch();
//			pkgSearch.setPkage_id("pk310001");
			pkgSearch.setPkage_gubun(1);
			pkgSearch.setToDesti(310);
			pkgSearch.setDates_start_check("2022-12-20");
			
			Map<String, Object> map = new HashMap<>();
			map.put("pkage_id", pkgSearch.getPkage_id());
			map.put("toDesti", pkgSearch.getToDesti());
			map.put("dates_start_check", pkgSearch.getDates_start_check());
			map.put("order", 3); // pkage_soldCnt(1), pkage_score(2), pkage_dt_Aprice(3,4)
			map.put("pkgSearch", pkgSearch);
			
			List<PkageDTORM> list = pkageService.selectPkgWithDetailAndFlight(map);
			log.info("test list = " + list);
			return list;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 테스트용
	@GetMapping("/test2")
	public PkageDTORM test2() {
		try {
			Integer pkage_dt_id = 1;
			
//			Pkage_detailDTO dto = pkageDao.selectPkgDetailById(pkage_dt_id);
			PkageDTORM dto = pkageDao.selectPkgByPkgId("pk110001");
			log.info("dto="+dto);
			return dto;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 테스트용
	@GetMapping("/test3")
	public Pkage_detailDTO test3() {
		try {
			Integer pkage_dt_id = 33;
			
			Pkage_detailDTO dto = pkageDao.selectPkgDetailById(pkage_dt_id);
			log.info("dto="+dto);
			
			// 해외만 비행일정이 있기 때문에 if문 걸어야함.
			if(dto.getPkage_flightScheDTOList().size() > 1) {
				// 출발 / 도착 비행 시간 계산
				for(Pkage_flightScheDTO fsh : dto.getPkage_flightScheDTOList()) {
					fsh.getTime();
				}
				
				// 비행일정이 있기 때문에 값 1로 변경  (jsp 에서 비행일정이 있는 것과 없는 것 구분해주기 위함)
				dto.setFlightExist(1);
			}
			
			return dto;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 테스트용
	@GetMapping("/test4")
	public Pkage_detailDTO test4() {
		try {
			Integer pkage_dt_id = 34;
			
			Pkage_detailDTO dto = pkageDao.selectPkgDetailById2(pkage_dt_id);
			log.info("dto="+dto);
			
			// 해외만 비행일정이 있기 때문에 if문 걸어야함.
			if(dto.getPkage_flightScheDTOList().size() > 1) {
				// 출발 / 도착 비행 시간 계산
				for(Pkage_flightScheDTO fsh : dto.getPkage_flightScheDTOList()) {
					fsh.getTime();
				}
				
				// 비행일정이 있기 때문에 값 1로 변경  (jsp 에서 비행일정이 있는 것과 없는 것 구분해주기 위함)
				dto.setFlightExist(1);
			}
			
			return dto;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
