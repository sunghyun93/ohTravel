package com.oracle.ohTravel.pkage.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.ohTravel.city.model.CityDTO;
import com.oracle.ohTravel.city.service.CityService;
import com.oracle.ohTravel.country.model.CountryDTO;
import com.oracle.ohTravel.country.service.CountryService;
import com.oracle.ohTravel.manager.model.CouponDTO;
import com.oracle.ohTravel.member.model.MemberDTO;
import com.oracle.ohTravel.member.service.MemberService;
import com.oracle.ohTravel.pkage.model.MaxPriceHighOrderComp;
import com.oracle.ohTravel.pkage.model.MinPriceHighOrderComp;
import com.oracle.ohTravel.pkage.model.PageHandler;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.pkage.model.PkageDTORM;
import com.oracle.ohTravel.pkage.model.Pkage_detailDTO;
import com.oracle.ohTravel.pkage.model.Pkage_flightScheDTO;
import com.oracle.ohTravel.pkage.model.Pkage_rsDTO;
import com.oracle.ohTravel.pkage.model.PkgReserve;
import com.oracle.ohTravel.pkage.model.PkgReserveEle;
import com.oracle.ohTravel.pkage.model.PkgSearch;
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
	@Autowired
	private MemberService memberService;
	
	// 국내 / 해외 패키지 상품 가져오는 메서드
	// 국내/해외 search 페이지(0:국내 1:해외)
	@GetMapping("/search/{gubun}")
	public String search01(@PathVariable("gubun")Integer gubun, Model model) {
		log.info("PkageController search01() start..."); 
		
		log.info("gubun = " + gubun);
		List<CountryDTO> countryList = null;
		try {
			// 가고싶은 나라 country 모두 가져오기 (한국-100 빼고)
			if(gubun == 1) {
				countryList = countryService.selectCountryByCountryId(100);
			}
			// 한국만 가져오기
			else if(gubun == 0) {
				countryList = countryService.selectCountryByCountryId2(100);
			}
			
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
			
			model.addAttribute("gubun", gubun);
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
	
	// 검색 결과 메서드
	@GetMapping("/searchResult")
	public String searchResult(PkgSearch pkgSearch, Model model, HttpServletRequest request, HttpSession session) {
		log.info("PkageController searchResult() start...");
		log.info("pkgSearch="+pkgSearch);
		
		String toURL = request.getRequestURI().toString(); // jsp 쪽에서 사용할 toURL
		String queryString = request.getQueryString();
		// & -> %26 으로 변환
		queryString = queryString.replaceAll("&", "%26");
		String redirectURL = toURL + "?" + queryString; // loginForm 으로 보낼 URL
		log.info("toURL = "+toURL);
		log.info("queryString = " + request.getQueryString());
		log.info("redirectURL = " + redirectURL);
		log.info("pkgSearch.getQueryString() = "+pkgSearch.getQueryString());
		
		if(pkgSearch.getOrder() == null) pkgSearch.setOrder(1); // 초기값 세팅
		
		// 찜한 상품인지 알기 위한 로그인한 회원의 ID 가져오기
		String mem_id = (String)session.getAttribute("sessionId");
		
		// 필터로 인해 넘어온 가격의 구분 정해주기 (max만 왔는지 - 1, min만 왔는지- 2, min max 모두 왔는지 - 3)
		pkgSearch.makeAmtGubun();
		// 필터로 인해 넘어온 출발 시간 값을 DB로 전달하기 위해 출발 시간 설정(AM-5~12, PM-12~18)
		pkgSearch.makeDBtime();
		log.info("AmtGubun = " + pkgSearch.getAmtGubun());
		log.info("chk_start_time = " + pkgSearch.getChk_start_time());
		log.info("chk_end_time = " + pkgSearch.getChk_end_time());
		
		try {
			// 국가 가져오기
			CountryDTO countryDTO = countryService.selectCountryByCityId(pkgSearch.getToDesti());
			pkgSearch.setCountry(countryDTO.getCountry_name());
			
			// 관련 pkg 테이블들 모두 가져오기 (상세의 일정 부분 제외)
			Map<String, Object> map = new HashMap<>();
			// pkage_id 가 null 이 아닌 경우는 검색을 해서 들어온 것이 아니고, 패키지는 클릭했을 때 해당 패키지에 대한 내용만 가져오기 위함
			map.put("mem_id", mem_id);
			map.put("pkage_id", pkgSearch.getPkage_id());
			map.put("toDesti", pkgSearch.getToDesti());
			map.put("dates_start_check", pkgSearch.getDates_start_check());
			map.put("order", pkgSearch.getOrder()); // pkage_soldCnt(1), pkage_score(2), pkage_dt_Aprice(3 desc,4 asc)
			map.put("amtGubun", pkgSearch.getAmtGubun()); // max만 왔는지 - 1, min만 왔는지- 2, min max 모두 왔는지 - 3
			map.put("pkgSearch", pkgSearch);	// 가격, 여행기간, 출발시간을 위해 전달
			
			List<PkageDTORM> pkageDTORmlist = pkageService.selectPkgWithDetailAndFlight(map);
			// 리뷰 개수는 service 단에서 가져옴
			
			// 관련 pkg 개수
			int pkgCnt = pkageService.selectPkgWithDetailAndFlightCnt(map);
			log.info("pkgCnt = " + pkgCnt);
			
			// 페이징 (PkgSearch, totalCnt, naviSize)
			PageHandler ph = new PageHandler(pkgSearch, pkgCnt, 10);
			
			// 패키지에 표시될 최소 가격 & 각 패키지에 포함된 상세 개수 & 요일  & 일수 구하기
			getMakingDetailByList(pkageDTORmlist);
			
			// 높은 가격 순 혹은 낮은 가격 정렬일 때, 패키지 detail 상품은 정렬이 되서 오는데, 패키지는 정렬되지 않음.
			//  패키지의 최소가격은  DB에서 정렬을 못하겠음. 그래서, 직접 자바에서 정렬해준 것.
			if(pkgSearch.getOrder() == 3) {
				Collections.sort(pkageDTORmlist, new MinPriceHighOrderComp());
			}
			if(pkgSearch.getOrder() == 4) {
				Collections.sort(pkageDTORmlist, new MaxPriceHighOrderComp());
			}
			
			log.info("pkageDTORmlist = " + pkageDTORmlist);
			
			model.addAttribute("toURL", toURL); // jsp 에서 사용할 URL
			model.addAttribute("redirectURL", redirectURL); // loginForm 으로 보낼 URL
			model.addAttribute("pkgCnt", pkgCnt);
			model.addAttribute("orderli", pkgSearch.getOrder());
			model.addAttribute("pkgSearch", pkgSearch);
			model.addAttribute("pkageDTORmlist", pkageDTORmlist);
			model.addAttribute("ph", ph);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		log.info("PkageController searchResult() end...");
		return "pkage/package_searchResult";
	}
	
	// 패키지 상세 상품가져오는 메서드
	@GetMapping("/detail")
	public String detail(String pkage_id, Integer pkage_dt_id, Model model, HttpServletRequest request) {
		log.info("PkageController detail() start...");
//		pkage_id 혹은 pkage_dt_id 중 하나라도 가져오지 않을 경우 처리
		if(pkage_id == null || pkage_dt_id == null) {
			return "redirect:/pkage/search/0";
		}
		
		String toURL = request.getRequestURI().toString(); // jsp 쪽에서 사용할 toURL
		String queryString = request.getQueryString();
		// & -> %26 으로 변환
		queryString = queryString.replaceAll("&", "%26");
		String redirectURL = toURL + "?" + queryString; // loginForm 으로 보낼 URL
		log.info("toURL = "+toURL);
		log.info("queryString = " + request.getQueryString());
		log.info("redirectURL = " + redirectURL);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pkage_id", pkage_id);
		map.put("pkage_dt_id", pkage_dt_id);
		try {
			PkageDTORM pkageDTORM = pkageService.selectPkgDetailWithSchedule(map);
			log.info("pkageDTORM="+pkageDTORM);
			
			// 패키지 상세의 일 수 구하기
			Pkage_detailDTO tmpDTO = pkageDTORM.getPkage_detailDTO();
			
			// 패키지 상세내의 필요 변수들 채우기
			getMakingDetailByDTO(tmpDTO);
			
			model.addAttribute("redirectURL", redirectURL);
			model.addAttribute("pkageDTORM", pkageDTORM);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		log.info("PkageController detail() end...");
		return "pkage/package_detail";
	}
	
	// 패키지 예약 페이지 메서드
	@GetMapping("/reservation")
	public String reservation(PkgReserve pkgReserve, Model model, HttpServletRequest request, HttpSession session) {
		log.info("PkageController reservation() start...");
		log.info("pkgReserve = " + pkgReserve);
		
		// 데이터 전달 확인 검사
		if(pkgReserve.getPkage_dt_id() == null) {
			String url = request.getRequestURI();
			return "redirect:"+url;
		}
		
		String toURL = request.getRequestURI().toString(); // jsp 쪽에서 사용할 toURL
		String queryString = request.getQueryString();
		// & -> %26 으로 변환
		queryString = queryString.replaceAll("&", "%26");
		String redirectURL = toURL + "?" + queryString; // loginForm 으로 보낼 URL
		log.info("toURL = "+toURL);
		log.info("queryString = " + request.getQueryString());
		log.info("redirectURL = " + redirectURL);
		
		// 현재 로그인하고 있는 사용자 정보
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		log.info("memberDTO = " + memberDTO);
		
		// 혹시 모르는 로그인  null 검사 (detail 에서 해줬는데 혹시 몰라서 넣어놓은 것)
		if(memberDTO == null) {
			return "redirect:/member/loginForm";
		}
		
		String mem_id = memberDTO.getMem_id();
		
		try {
			// 패키지 가져오기(항공편의 도착 때문에 가져옴)
			PkageDTORM pkageDTORM = pkageService.selectPkgByPkgId(pkgReserve.getPkage_id());
			
			// 패키지 상세 가져오기
			Pkage_detailDTO pkage_detailDTO = pkageService.selectPkgDetailById2(pkgReserve.getPkage_dt_id());
			// 패키지 상세내의 필요 변수들 채우기
			getMakingDetailByDTO(pkage_detailDTO);
			
			// 총 가격 만들어주기
			pkgReserve.makeTotalPay(pkage_detailDTO.getPkage_dt_Aprice(), pkage_detailDTO.getPkage_dt_Cprice());
			
			// 멤버 (등급 까지 들고가기)
			memberDTO = memberService.selectMemberWithGrade(mem_id);
			
			// 멤버가 사용할 수 있는 쿠폰 
			List<CouponDTO> couponList = memberService.selectMemberWithCoupon(mem_id);
			log.info("couponList = " + couponList);
			memberDTO.setCouponList(couponList);
			
			// 회원 등급 적용한 가격 가져가기
			int priceWithGd = pkgReserve.getTotalPay() - (pkgReserve.getTotalPay()*memberDTO.getMembership_discount() / 100); 
			log.info("priceWithGd = " + priceWithGd);
			
			// 회원 등급 적용한 마일리지 가져가기
			int mile = pkgReserve.getTotalPay() * memberDTO.getMembership_discount() / 100;
			
			model.addAttribute("redirectURL", redirectURL);
			model.addAttribute("mile", mile);	// 적용할 마일리지
			model.addAttribute("priceWithGd", priceWithGd); // 회원 등급 적용한 가격 
			model.addAttribute("pkageDTORM", pkageDTORM);
			model.addAttribute("pkage_detailDTO", pkage_detailDTO);
			model.addAttribute("memberDTO", memberDTO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("pkgReserve", pkgReserve);
		log.info("PkageController reservation() end...");
		return "pkage/package_reservation";
	}
	
//	예약하기 메서드
	@PostMapping("/reserve")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> reserve(PkgReserveEle pkgReserveEle,  Model model, HttpSession session) {
		log.info("PkageController reserve() start...");
		log.info("pkgReserveEle = " + pkgReserveEle);
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		// 로그인 안되어 있으면 redirect
//		if(memberDTO == null) {
//			return "redirect:/member/loginForm";
//		}
		
//		결과를 받아 전달할 map
		Map<String, Object> resultMap = null;
		try {
			String mem_id = memberDTO.getMem_id();
			
			// Map 만들어 주기
			Map<String, Object> map = new HashMap<>();
			map.put("mem_id", mem_id);
			map.put("pkgReserveEle", pkgReserveEle);
			
			// Pkage_rsDTO 만들기
			Pkage_rsDTO pkage_rsDTO = new Pkage_rsDTO();
			pkage_rsDTO.setPkage_dt_id(pkgReserveEle.getPkage_dt_id());
			pkage_rsDTO.setMem_id(mem_id);
			pkage_rsDTO.setPkage_rv_Acnt(pkgReserveEle.getPkage_rv_Acnt());
			pkage_rsDTO.setPkage_rv_Ccnt(pkgReserveEle.getPkage_rv_Ccnt());
			pkage_rsDTO.setPkage_rv_tprice(pkgReserveEle.getPkage_rv_tprice());
			map.put("pkage_rsDTO", pkage_rsDTO);
			
			// insert 결과 받기		
			resultMap = pkageService.insertPkgReserveInsertWithAll(map);
			
			log.info("PkageController reserve() end...");
			// 결과가 0 이면 fail, 0 이 아니면 OK
			if((Integer)resultMap.get("rowCnt") == 0) {
				return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.INTERNAL_SERVER_ERROR);
			} else {
				return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
			}
		} catch(Exception e) {
			e.printStackTrace();
			resultMap.put("rowCnt", 0);
			return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.BAD_REQUEST);
		}
		
		
	}
	
//	결제 완료 페이지
	@PostMapping("/reserveComplete")
	public String reserveComplete(Integer pkage_rv_id, Model model) {
		log.info("PkageController reserveComplete() start...");
		log.info("pkage_rv_id = " + pkage_rv_id);
		try {
			Pkage_rsDTO pkage_rsDTO = pkageService.selectPkgReservById(pkage_rv_id);
			log.info("pkage_rsDTO = " + pkage_rsDTO);
			model.addAttribute("pkage_rsDTO", pkage_rsDTO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		log.info("PkageController reserveComplete() end...");
		return "pkage/package_completeReserve";
	}
	
	// 패키지에 표시될 최소 가격 & 각 패키지에 포함된 상세 개수 & 요일  & 일수(전체 상품 디테일들 중 최소 기간과 최대기간) 구하기
	private void getMakingDetailByList(List<PkageDTORM> list) {
		for(PkageDTORM pkageDTORM : list) {
			ArrayList<Integer> priceBox = new ArrayList<>(); // 가격을 정렬을 위한 변수
//			ArrayList<Long> daysBox = new ArrayList<>();
			
			// 최소/최대(전체 상품 디테일들 중 최소 기간과 최대기간) 일 수를 저장할 변수
			pkageDTORM.setDaysList(new ArrayList<Long>());
			
			List<Pkage_detailDTO> detailDTOList = pkageDTORM.getPkage_detailDTOList();
			
			// 패키지 마다 패키지 상세 개수 값 넣어주기 
			int size = detailDTOList.size();
			pkageDTORM.setPkage_detailDTOListCnt(size);
			
			int i = 0;
			for(Pkage_detailDTO pkage_detailDTO: detailDTOList) {
				// 각 패키지 상세의 성인가격 채우기 
				priceBox.add(pkage_detailDTO.getPkage_dt_Aprice());
				
				// 요일 구하기
				Date date = pkage_detailDTO.getPkage_dt_startDay();
				String yoil = pkage_detailDTO.getYoil(date);
				pkage_detailDTO.setStartYoil(yoil);
				
				date = pkage_detailDTO.getPkage_dt_endDay();
				yoil = pkage_detailDTO.getYoil(date);
				pkage_detailDTO.setEndYoil(yoil);
				
				// 일수 구하기
				long day = pkage_detailDTO.getDay(pkage_detailDTO.getPkage_dt_startDay(), pkage_detailDTO.getPkage_dt_endDay());
				
				pkage_detailDTO.setDay(day);

				// 패키지 종합 일 수에 넣어주기 (최소/최대 일 수 구하기 위함)
				if(i == 0 || i == size-1) {
					pkageDTORM.getDaysList().add(day);
					// 똑같은 일 수인 패키지 상품이 있다면 1개만 넣기 - ex)view 단에서 2일 ~ 2일이라고 표시하지 않기 위함
					if(pkageDTORM.getDaysList().size() == 2 && pkageDTORM.getDaysList().get(0) == pkageDTORM.getDaysList().get(1)) {
						pkageDTORM.getDaysList().remove(1);
					}
				}
				i++;
			}
			
			// detail 개수 넣기
			pkageDTORM.setPkgDetailCnt(detailDTOList.size());
			
			// 일수 정렬 
			Collections.sort(pkageDTORM.getDaysList());
			log.info("daysList = " + pkageDTORM.getDaysList());

			// 정렬 후 1번째, 마지막 가격 넣기
			Collections.sort(priceBox);
			pkageDTORM.setMinPrice(priceBox.get(0));
			pkageDTORM.setMaxPrice(priceBox.get(priceBox.size()-1));
		}
	}
	
	// pkg 상품 detail 의 필요 변수들 값 만들기(예약 가능 인원 구하기, 출발/도착 요일, 일 수, 출발/도착 때 걸린 비행시간, 비행 일정 유무 구분)
	private void getMakingDetailByDTO(Pkage_detailDTO tmpDTO) {
		// 예약 가능 인원 만들어 주기
		tmpDTO.setPossibleCnt(tmpDTO.getPkage_dt_cnt() - tmpDTO.getPkage_dt_Rcnt());
		
		Date start = tmpDTO.getPkage_dt_startDay();
		Date end = tmpDTO.getPkage_dt_endDay();
		tmpDTO.setDay(tmpDTO.getDay(start, end));
		
		// 요일 구하기
		Date date = tmpDTO.getPkage_dt_startDay();
		String yoil = tmpDTO.getYoil(date);
		tmpDTO.setStartYoil(yoil);
		
		date = tmpDTO.getPkage_dt_endDay();
		yoil = tmpDTO.getYoil(date);
		tmpDTO.setEndYoil(yoil);
		
		// 해외만 비행일정이 있기 때문에 if문 걸어야함.
		if(tmpDTO.getPkage_flightScheDTOList().size() > 1) {
			// 출발 / 도착 비행 시간 계산
			for(Pkage_flightScheDTO fsh : tmpDTO.getPkage_flightScheDTOList()) {
				fsh.getTime();
			}
			
			// 비행일정이 있기 때문에 값 1로 변경  (jsp 에서 비행일정이 있는 것과 없는 것 구분해주기 위함)
			tmpDTO.setFlightExist(1);
		}
	}
}
