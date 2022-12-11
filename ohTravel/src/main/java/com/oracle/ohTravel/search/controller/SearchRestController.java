package com.oracle.ohTravel.search.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.search.service.SearchService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class SearchRestController {
	
	private final SearchService ss;
	
	@GetMapping("/pkageFilter")
	public List<PkageDTO> pkageFilter(@RequestParam(value = "check") List<String> check, @RequestParam(value = "radioCheck1") String radioCheck,  PkageDTO pkageDTO, String currentPage) {
		System.out.println("check -> " + check);
		System.out.println("radioCheck -> " + radioCheck);
		HashMap<String, Object> pkageHM = new HashMap<>();
		pkageHM.put("pkageDTO", pkageDTO) ;
		pkageHM.put("check", check) ;
		pkageHM.put("radioCheck", radioCheck) ;
		System.out.println(check);
		System.out.println("pkageDTO"  + pkageDTO.getCheck());
		System.out.println("search_word -> " + pkageDTO.getSearch_word());
		System.out.println("currentPage -> " + currentPage);
		List<PkageDTO> pkList = ss.filteredPkageList(pkageHM);
		System.out.println("필터된 리스트 수 -> " + pkList.size());
		return pkList;
	}
	
	@GetMapping("/hotelFilter")
	public List<HotelDTO> pkageFilter(@RequestParam(value = "check") List<String> check, HotelDTO hotelDTO, String currentPage) {
		System.out.println("check -> " + check);
		HashMap<String, Object> hotelHM = new HashMap<String, Object>();
		hotelHM.put("hotelDTO", hotelDTO);
		hotelHM.put("check", check);
		System.out.println("search_word -> " + hotelDTO.getSearch_word());
		System.out.println("currentPage -> " + currentPage);
		List<HotelDTO> htList = ss.filteredHotelList(hotelHM);
		System.out.println("필터된 리스트 수 -> " + htList.size());
		return htList;
	}
	
	@GetMapping("/packageFilterReset")
	public List<PkageDTO> packageFilterReset(PkageDTO pkageDTO, String currentPage) {
		System.out.println("packageFilterReset Controller");
		List<PkageDTO> pkageResetList = ss.getPkageList(pkageDTO);
		System.out.println("필터된 리스트 수 -> " + pkageResetList.size());
		return  pkageResetList;
	}
	
	@GetMapping("/hotelFilterReset")
	public List<HotelDTO> hotelFilterReset(HotelDTO hotelDTO, String currentPage) {
		System.out.println("hotelFilterReset Controller");
		List<HotelDTO> hotelResetList = ss.getHotelList(hotelDTO);
		System.out.println("필터된 리스트 수 -> " + hotelResetList.size());
		return  hotelResetList;
	}
	
	@GetMapping("/insertFavorite")
	public String insertFavorite(PkageDTO pkageDTO, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("insertFavorite Controller");
		int result = 0;
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		if (mem_id == null) {
			System.out.println("로그인ㄱㄱ");
		} else result = ss.insertFavorite(pkageDTO);
		
		if (result > 0) System.out.println("찜 등록 완료");
		return "";
	}
}


