package com.oracle.ohTravel.search.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.search.service.SearchService;
import com.oracle.ohTravel.ticket.model.TicketModel;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SearchController {
	
	private final SearchService ss;
	
	@GetMapping("/search/searchResult")
	public String searchResult(String search_word, Model model) {
		System.out.println("Controller SearchResultPage Start...");
		model.addAttribute("search_word", search_word);
		// 입장권 목록
//		List<TicketModel> ticketList = ss.getTicketList(search_word);
//		model.addAttribute("ticketList", ticketList);

		// 호텔 목록
//		List<<Hotel> hotelList = ss.getHotelList(search_word);
//		model.addAttribute("hotelList", hotelList);
		
		// 패키지 목록
		List<PkageDTO> pkageList = ss.getPkageList(search_word);
		System.out.println("Controller pkageList -> " + pkageList);
		model.addAttribute("pkageList", pkageList);
		// 패키지 목록 개수
		System.out.println("Controller pkageList.size() -> " + pkageList.size());
		model.addAttribute("pkageListCount", pkageList.size());

		return "search/searchResultPage";
	}
}
