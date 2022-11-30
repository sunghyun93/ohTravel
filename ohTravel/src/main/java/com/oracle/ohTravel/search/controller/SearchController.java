package com.oracle.ohTravel.search.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.search.service.Paging;
import com.oracle.ohTravel.search.service.SearchService;
import com.oracle.ohTravel.ticket.model.TicketDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SearchController {
	
	private final SearchService ss;
	
	@GetMapping("/search/searchResult")
	public String searchResult(PkageDTO pkageDTO, Model model) {
		System.out.println("Controller SearchResultPage Start...");
		model.addAttribute("search_word", pkageDTO.getSearch_word());

		// 입장권 목록
		List<TicketDTO> ticketList = ss.getTicketList(pkageDTO);
		System.out.println("Controller ticketList -> " + ticketList);
		model.addAttribute("ticketList", ticketList);
		System.out.println("Controller ticketList.size() -> " + ticketList.size());
		model.addAttribute("ticketListCount", ticketList.size());

		// 호텔 목록
		List<HotelDTO> hotelList = ss.getHotelList(pkageDTO);
		System.out.println("Controller hotelList -> " + hotelList);
		model.addAttribute("hotelList", hotelList);
		System.out.println("Controller hotelList.size() -> " + hotelList.size());
		model.addAttribute("hotelListCount", hotelList.size());
		
		// 패키지 목록
		List<PkageDTO> pkageList = ss.getPkageList(pkageDTO);
		System.out.println("Controller pkageList -> " + pkageList);
		model.addAttribute("pkageList", pkageList);
		// 패키지 목록 개수
		System.out.println("Controller pkageList.size() -> " + pkageList.size());
		model.addAttribute("pkageListCount", pkageList.size());

		return "search/searchResultPage";
	}
	
	@GetMapping("/searchCategoryAjax")
	public String searchCategoryAjax(String gubun, Model model, HotelDTO hotelDTO, PkageDTO pkageDTO, String currentPage) {
		System.out.println("Controller searchPkageAjax");
		System.out.println(pkageDTO.getSearch_word()+", "+gubun);
		System.out.println("start " + pkageDTO.getStart());
		System.out.println("end " + pkageDTO.getEnd());
		System.out.println("currentPage -> " + currentPage);

		if (gubun.equals("pkage")) {
			List<PkageDTO> pkageList = ss.getPkageList(pkageDTO);
			System.out.println("Controller pkageList -> " + pkageList);
			model.addAttribute("pkageList", pkageList);
			model.addAttribute("pkageListCount", pkageList.size());
			// Paging 작업
			int totalPkage = pkageList.size();
			Paging page = new Paging(totalPkage, currentPage); // currentPage Paging 메소드 안에서 null값 체크해줌
			// Parameter emp --> Page만 추가 Setting
			pkageDTO.setStart(page.getStart());
			pkageDTO.setEnd(page.getEnd());
			System.out.println("pkageDTO.getStart() " + pkageDTO.getStart());
			System.out.println("pkageDTO.getEnd() " + pkageDTO.getEnd());
			model.addAttribute("page", page);
			return "/search/searchResultPkage";
		} 
		
		if (gubun.equals("hotel")) {
			List<HotelDTO> hotelList = ss.getHotelList(pkageDTO);
			System.out.println("Controller hoteList -> " + hotelList);
			model.addAttribute("hotelList", hotelList);
			model.addAttribute("hotelListCount", hotelList.size());
			// Paging 작업
			Paging page = new Paging(hotelList.size(), currentPage); // currentPage Paging 메소드 안에서 null값 체크해줌
			// Parameter emp --> Page만 추가 Setting
			hotelDTO.setStart(page.getStart());
			hotelDTO.setEnd(page.getEnd());
			System.out.println("page.getStart() " + page.getStart());
			System.out.println("page.getEnd() " + page.getEnd());
			model.addAttribute("page", page);
			return "/search/searchResultHotel";
		} 
		
		if (gubun.equals("ticket")) {
			List<TicketDTO> ticketList = ss.getTicketList(pkageDTO);
			System.out.println("Controller ticketList -> " + ticketList);
			model.addAttribute("ticketList", ticketList);
			model.addAttribute("ticketListCount", ticketList.size());
			// Paging
			Paging page = new Paging(ticketList.size(), currentPage);
			System.out.println("page.getStart() " + page.getStart());
			System.out.println("page.getEnd() " + page.getEnd());
			model.addAttribute("page", page);
			return "/search/searchResultTicket";
		} 
		
		if (gubun.equals("all")) {
			System.out.println("Controller all");
			model.addAttribute("search_word", pkageDTO);
			// 입장권 목록
			List<TicketDTO> ticketList = ss.getTicketList(pkageDTO);
			System.out.println("Controller ticketList -> " + ticketList);
			model.addAttribute("ticketList", ticketList);
			System.out.println("Controller ticketList.size() -> " + ticketList.size());
			model.addAttribute("ticketListCount", ticketList.size());

			// 호텔 목록
			List<HotelDTO> hotelList = ss.getHotelList(pkageDTO);
			System.out.println("Controller hotelList -> " + hotelList);
			model.addAttribute("hotelList", hotelList);
			System.out.println("Controller hotelList.size() -> " + hotelList.size());
			model.addAttribute("hotelListCount", hotelList.size());
			
			// 패키지 목록
			List<PkageDTO> pkageList = ss.getPkageList(pkageDTO);
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
