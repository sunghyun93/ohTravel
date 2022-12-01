package com.oracle.ohTravel.search.controller;

import java.util.List;

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
	public List<PkageDTO> pkageFilter(@RequestParam(value = "check") String[] check, PkageDTO pkageDTO, String currentPage) {
		System.out.println("check -> " + check);
		System.out.println("search_word -> " + pkageDTO.getSearch_word());
		System.out.println("currentPage -> " + currentPage);
		List<PkageDTO> pkList = ss.filteredPkageList(pkageDTO);
		System.out.println("필터된 리스트 수 -> " + pkList.size());
		return pkList;
	}
	
	@GetMapping("/hotelFilter")
	public List<HotelDTO> pkageFilter(@RequestParam(value = "check") String[] check, HotelDTO hotelDTO, String currentPage) {
		System.out.println("check -> " + check);
		System.out.println("search_word -> " + hotelDTO.getSearch_word());
		System.out.println("currentPage -> " + currentPage);
		List<HotelDTO> htList = ss.filteredHotelList(hotelDTO);
		System.out.println("필터된 리스트 수 -> " + htList.size());
		return htList;
	}
}


