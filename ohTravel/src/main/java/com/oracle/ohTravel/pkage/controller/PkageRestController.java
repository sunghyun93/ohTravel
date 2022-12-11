package com.oracle.ohTravel.pkage.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import com.oracle.ohTravel.pkage.model.Pkage_rsDTO;
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
		if(session.getAttribute("member") != null)
			log.info("로그인ID="+((MemberDTO)session.getAttribute("member")).getMem_id());
		if(!loginCheck) {
			log.info("PkageRestController loginCheck() end");
			return new ResponseEntity<String>("LOGIN_OK", HttpStatus.OK);
		} else {
			log.info("PkageRestController loginCheck() end");
			return new ResponseEntity<String>("LOGIN_NO", HttpStatus.OK);
		}
	}
	
	// 이미 예약한 상품인지 체크 용
	@PostMapping("/reservedCheck")
	public ResponseEntity<String> reservedCheck(String pkage_dt_id, HttpSession session) {
		log.info("PkageRestController reservedCheck() start");
		String mem_id = ((MemberDTO)session.getAttribute("member")).getMem_id();
		
		log.info("mem_id = " + mem_id);
		log.info("pkage_dt_id = " + pkage_dt_id);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pkage_dt_id", pkage_dt_id);
		map.put("mem_id", mem_id);
		
		Integer check = 0;
		try {
			check = pkageService.selectPkgDetailReservCheck(map);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		// check가 1이면 이미 예약한 상품
		if(check != null) {
			log.info("PkageRestController reservedCheck() end");
			return new ResponseEntity<String>("reserved", HttpStatus.OK);
		} else {
			log.info("PkageRestController reservedCheck() end");
			return new ResponseEntity<String>("reservedNo", HttpStatus.OK);
		}
	}
	
	// 사용자가 요청한 예약 인원 수와 해당 패키지 상품의 예약 가능 인원 수 비교하기 위한 메서드
	@GetMapping("/reservedCntCheck")
	public ResponseEntity<String> reservedCntCheck(Integer pkage_dt_id, Integer reservedCnt) {
		log.info("PkageRestController reservedCntCheck() start...");
		try {
			Pkage_detailDTO pkage_detailDTO = pkageService.selectPkgDetailById3(pkage_dt_id);
			// 예약 가능 인원 만들어 주기
			pkage_detailDTO.setPossibleCnt(pkage_detailDTO.getPkage_dt_cnt() - pkage_detailDTO.getPkage_dt_Rcnt());
			int possibleCnt = pkage_detailDTO.getPossibleCnt(); // 패키지 상품의 예약 가능 인원
			
			log.info("PkageRestController reservedCntCheck() end...");
//			요청 인원과 관계없이 예약 가능 인원 수가 0 이면 return
			if(possibleCnt == 0) {
				return new ResponseEntity<String>("impossible", HttpStatus.OK);
			}
			
//			넘어온 요청 예약 인원 수가 패키지 상품의 예약 가능 인원 수를 초과하면 "no"를 전달
			if(possibleCnt < reservedCnt) {
				return new ResponseEntity<String>("no", HttpStatus.OK);
			} else {
				return new ResponseEntity<String>("yes", HttpStatus.OK);
			}
		} catch(Exception e) {
			return new ResponseEntity<String>("error", HttpStatus.BAD_REQUEST);
		}
	}
	
	// mem_id와 회원이 선택한 pkage_dt_id를 받아 해당 회원의 예약된 것들 중에 선택한 pkage_dt_id의 날짜와 겹치는 것이 있는지 판단
	@GetMapping("/duplicateReserve")
	public ResponseEntity<String> duplicateReserve(String mem_id, Integer pkage_dt_id) {
		log.info("PkageRestController duplicateReserve() start...");
		log.info("mem_id = " + mem_id);
		log.info("pkage_dt_id = " + pkage_dt_id);
		
		Map<String, Object> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("pkage_dt_id", pkage_dt_id);
		
		try {
			Pkage_detailDTO pkage_detailDTO = pkageService.selectPkgDetailById3(pkage_dt_id);
			List<Pkage_rsDTO> pkage_rsDTO = pkageService.selectPkgReservByMem_id(mem_id);
			
			// 값이 1 이상이면 겹치는 날짜가 있는 것
			int duplicate = duplicateReserve(pkage_detailDTO, pkage_rsDTO);
			log.info("duplicate = " + duplicate);
			
			if(duplicate > 0) {
				return new ResponseEntity<String>("duplicate", HttpStatus.OK);
			} else {
				return new ResponseEntity<String>("duplicateNo", HttpStatus.OK);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("Error", HttpStatus.BAD_REQUEST);
		}
	}
	
//	예약 하려는 패키지 상품의 기간이 현재 예약 중인 것들의 기간에 포함되는지 여부(0:포함 X, 1:포함 O)
	private int duplicateReserve(Pkage_detailDTO pkage_detailDTO, List<Pkage_rsDTO> pkage_rsDTOList) {
		int duplicate = 0; // 0 이면 겹치는 날짜 없음, 1이면 겹치는 날짜 있음
		
		// 예약하려는 패키지 상품의 시작/종료 날짜
		Date startDate = pkage_detailDTO.getPkage_dt_startDay();
		Date endDate = pkage_detailDTO.getPkage_dt_endDay();

		// Date의 시분초 초기화
		initDate(startDate, endDate);
		log.info("startLD = " + startDate);
		log.info("endLD = " + endDate);
		// 예약 하려는 패키지 상품의 기간 리스트 구하기
		List<Date> dateList = getDateList(startDate, endDate);
		
		// 예약된 것들과 예약하려는 상품의 기간 비교
		outer: 
		for(Pkage_rsDTO dto : pkage_rsDTOList) {
			Date rsStartDate = dto.getPkage_detailDTO().getPkage_dt_startDay();
			Date rsEndDate = dto.getPkage_detailDTO().getPkage_dt_endDay();
			
			// 시분초 초기화
			initDate(rsStartDate, rsEndDate);
			
			log.info("for 문 안의 rsStartDate = " + rsStartDate);
			log.info("for 문 안의 rsEndDate = " + rsEndDate);
			
			// 예약하려는 패키지 기간의 날짜를 하나하나 비교
			for(Date detailDate : dateList) {
				// compareTo : 크면(양수), 같으면(0), 작으면(음수)
				if(detailDate.compareTo(rsStartDate) >= 0 && rsEndDate.compareTo(detailDate) >= 0) {
					duplicate = 1;
					break outer;
				}
			}
		}

		return duplicate;
	}
	
//	출발/종료 날짜의 시간 초기화 함수
	private void initDate(Date d1, Date d2) {
		d1.setHours(0);
		d1.setMinutes(0);
		d1.setSeconds(0);
		d2.setHours(23);
		d2.setMinutes(59);
		d2.setSeconds(59);
	}
	
//	두 날짜 사이의 날짜 리스트 구하기
	private List<Date> getDateList(Date d1, Date d2) {
		List<Date> list = new ArrayList<>();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		// Date -> Calendar 변환
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
				
		c1.setTime(d1);
		c2.setTime(d2);
		
		String startDay = sdf.format(c1.getTime());
		String endDay = sdf.format(c2.getTime());
		try {
			// 당일 치기 일 때를 고려하기 위함.
			if(startDay.equals(endDay)) {
				list.add(sdf.parse(startDay));
			}
			
			int i = 0;
			while(!startDay.equals(endDay)) {
			
				if(i == 0) {
					log.info("getDateList startDay = " + startDay);
					list.add(sdf.parse(startDay));
				}
				c1.add(Calendar.DATE, 1);
				startDay = sdf.format(c1.getTime());
				log.info("getDateList startDay = " + startDay);
				list.add(sdf.parse(startDay));
				i++;
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		log.info("getDateList list = " + list);
		return list;
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
			pkgSearch.setMinAmt("400000");
			pkgSearch.setMaxAmt("600000");
			pkgSearch.makeAmtGubun(); // max만 왔는지 - 1, min만 왔는지- 2, min max 모두 왔는지 - 3
			
			Map<String, Object> map = new HashMap<>();
			map.put("mem_id", "test1");	// 로그인한 회원이 찜한 상품인지 가리기 위한 데이터
			map.put("pkage_id", pkgSearch.getPkage_id());
			map.put("toDesti", pkgSearch.getToDesti());
			map.put("dates_start_check", pkgSearch.getDates_start_check());
			map.put("amtGubun", pkgSearch.getAmtGubun());
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
	
	// 패키지 예약 데이터 가져오기 테스트용
	@GetMapping("/test5")
	public Pkage_rsDTO test5() {
		try {
			Integer pkage_rv_id = 3;
			
			Pkage_rsDTO pkage_rsDTO = pkageDao.selectPkgReservById(pkage_rv_id);
			
			return pkage_rsDTO;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
