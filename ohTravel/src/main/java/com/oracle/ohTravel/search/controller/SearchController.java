package com.oracle.ohTravel.search.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.search.service.SearchService;
import com.oracle.ohTravel.ticket.model.TicketDTO;

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
		List<TicketDTO> ticketList = ss.getTicketList(search_word);
		System.out.println("Controller ticketList -> " + ticketList);
		model.addAttribute("ticketList", ticketList);
		System.out.println("Controller ticketList.size() -> " + ticketList.size());
		model.addAttribute("ticketListCount", ticketList.size());

		// 호텔 목록
		List<HotelDTO> hotelList = ss.getHotelList(search_word);
		System.out.println("Controller hotelList -> " + hotelList);
		model.addAttribute("hotelList", hotelList);
		System.out.println("Controller hotelList.size() -> " + hotelList.size());
		model.addAttribute("hotelListCount", hotelList.size());
		
		// 패키지 목록
		List<PkageDTO> pkageList = ss.getPkageList(search_word);
		System.out.println("Controller pkageList -> " + pkageList);
		model.addAttribute("pkageList", pkageList);
		// 패키지 목록 개수
		System.out.println("Controller pkageList.size() -> " + pkageList.size());
		model.addAttribute("pkageListCount", pkageList.size());

		return "search/searchResultPage";
	}
	
	@GetMapping("/searchCategoryAjax")
	public String searchCategoryAjax(String search_word, String gubun, Model model) {
		System.out.println("Controller searchPkageAjax");
		System.out.println(search_word+", "+gubun);
		
		if (gubun.equals("pkage")) {
			List<PkageDTO> pkageList = ss.getPkageList(search_word);
			System.out.println("Controller pkageList -> " + pkageList);
			model.addAttribute("pkageList", pkageList);
			model.addAttribute("pkageListCount", pkageList.size());
			return "/search/searchResultPkage";
		} 
		
		if (gubun.equals("hotel")) {
			List<HotelDTO> hotelList = ss.getHotelList(search_word);
			System.out.println("Controller hoteList -> " + hotelList);
			model.addAttribute("hotelList", hotelList);
			model.addAttribute("hotelListCount", hotelList.size());
			return "/search/searchResultHotel";
		} 
		
		if (gubun.equals("ticket")) {
			List<TicketDTO> ticketList = ss.getTicketList(search_word);
			System.out.println("Controller ticketList -> " + ticketList);
			model.addAttribute("ticketList", ticketList);
			model.addAttribute("ticketListCount", ticketList.size());
			return "/search/searchResultTicket";
		} 
		
		if (gubun.equals("all")) {
			System.out.println("Controller all");
			model.addAttribute("search_word", search_word);
			// 입장권 목록
			List<TicketDTO> ticketList = ss.getTicketList(search_word);
			System.out.println("Controller ticketList -> " + ticketList);
			model.addAttribute("ticketList", ticketList);
			System.out.println("Controller ticketList.size() -> " + ticketList.size());
			model.addAttribute("ticketListCount", ticketList.size());

			// 호텔 목록
			List<HotelDTO> hotelList = ss.getHotelList(search_word);
			System.out.println("Controller hotelList -> " + hotelList);
			model.addAttribute("hotelList", hotelList);
			System.out.println("Controller hotelList.size() -> " + hotelList.size());
			model.addAttribute("hotelListCount", hotelList.size());
			
			// 패키지 목록
			List<PkageDTO> pkageList = ss.getPkageList(search_word);
			System.out.println("Controller pkageList -> " + pkageList);
			model.addAttribute("pkageList", pkageList);
			// 패키지 목록 개수
			System.out.println("Controller pkageList.size() -> " + pkageList.size());
			model.addAttribute("pkageListCount", pkageList.size());

			return "/search/searchResultPageAjax";
		}
		else return "/search/searchResultAirplane";
	}
}
