package com.oracle.ohTravel.search.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.search.model.CategoryDTOVO;
import com.oracle.ohTravel.search.service.Paging;
import com.oracle.ohTravel.search.service.SearchService;
import com.oracle.ohTravel.ticket.model.TicketDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SearchController {
	
	private final SearchService ss;
	
	@GetMapping("/search/searchResult")
	public String searchResult(PkageDTO pkageDTO, HotelDTO hotelDTO, TicketDTO ticketDTO, Model model) {
		System.out.println("Controller SearchResultPage Start...");
		model.addAttribute("search_word", pkageDTO.getSearch_word());

		// 입장권 목록
		List<TicketDTO> ticketList = ss.getTicketList(ticketDTO);
		System.out.println("Controller ticketList -> " + ticketList);
		model.addAttribute("ticketList", ticketList);
		System.out.println("Controller ticketList.size() -> " + ticketList.size());
		model.addAttribute("ticketListCount", ticketList.size());

		// 호텔 목록
		List<HotelDTO> hotelList = ss.getHotelList(hotelDTO);
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
	
	@GetMapping("/search/searchCategoryAjax")
	@ResponseBody
	public CategoryDTOVO searchCategoryAjax(String gubun, HotelDTO hotelDTO, PkageDTO pkageDTO, TicketDTO ticketDTO, 
			 String currentPage, String search_word) {
		System.out.println("Controller searchPkageAjax");
		System.out.println(pkageDTO.getSearch_word()+", "+gubun);
		System.out.println("currentPage -> " + currentPage);

		if (gubun.equals("pkage")) {
			List<PkageDTO> pkageList = ss.getPkageList(pkageDTO);
			System.out.println("Controller pkageList -> " + pkageList);
			// Paging 작업
			int totalPkage = pkageList.size();
			System.out.println("totalPkage -> " + totalPkage);
			Paging page = new Paging(totalPkage, currentPage); // currentPage Paging 메소드 안에서 null값 체크해줌
			pkageDTO.setStart(page.getStart());
			pkageDTO.setEnd(page.getEnd());
			// 페이지 받아옴
			List<PkageDTO> pkageList2 = ss.getPkageList(pkageDTO);
			int totalPkage2 = pkageList2.size();
//			Paging page2 = new Paging(totalPkage2, currentPage); 
			System.out.println("totalPkage2 -> " + totalPkage2);
			System.out.println("pkageDTO.getStart() " + pkageDTO.getStart());
			System.out.println("pkageDTO.getEnd() " + pkageDTO.getEnd());
//			System.out.println("page -> " + page2);
			CategoryDTOVO pkageDTOVO = new CategoryDTOVO();
			pkageDTOVO.setPkageList(pkageList2);
			pkageDTOVO.setPaging(page);
			pkageDTOVO.setSearch_word(search_word);
			pkageDTOVO.setTotalPkage(totalPkage2);
			return pkageDTOVO;
		} 
		
		if (gubun.equals("hotel")) {
			List<HotelDTO> hotelList = ss.getHotelList(hotelDTO);
			System.out.println("Controller hoteList -> " + hotelList);
			// Paging 작업
			int totalHotel = hotelList.size();
			Paging page = new Paging(totalHotel, currentPage); // currentPage Paging 메소드 안에서 null값 체크해줌
			hotelDTO.setStart(page.getStart());
			hotelDTO.setEnd(page.getEnd());
			// 페이지 받아옴
			List<HotelDTO> hotelList2 = ss.getHotelList(hotelDTO);
			int totalHotel2 = hotelList2.size();
			Paging page2 = new Paging(totalHotel2, currentPage); 
			System.out.println("totalHotel2 -> " + totalHotel2);
			System.out.println("page.getStart() " + hotelDTO.getStart());
			System.out.println("page.getEnd() " + hotelDTO.getEnd());
			System.out.println("page -> " + page2);
			CategoryDTOVO hotelDTOVO = new CategoryDTOVO();
			hotelDTOVO.setHotelList(hotelList2);
			hotelDTOVO.setPaging(page2);
			hotelDTOVO.setTotalHotel(totalHotel2);
			return hotelDTOVO;
		} 
		
		if(gubun.equals("ticket")) {
			List<TicketDTO> ticketList = ss.getTicketList(ticketDTO);
			System.out.println("Controller ticketList -> " + ticketList);
			// Paging 작업
			int totalTicket = ticketList.size();
			Paging page = new Paging(totalTicket, currentPage); // currentPage Paging 메소드 안에서 null값 체크해줌
			ticketDTO.setStart(page.getStart());
			ticketDTO.setEnd(page.getEnd());
			// 페이지 받아옴
			List<TicketDTO> ticketList2 = ss.getTicketList(ticketDTO);
			int totalTicket2 = ticketList2.size();
			Paging page2 = new Paging(totalTicket2, currentPage); 
			System.out.println("totalTicket2 -> " + totalTicket2);
			System.out.println("page.getStart() " + ticketDTO.getStart());
			System.out.println("page.getEnd() " + ticketDTO.getEnd());
			System.out.println("page -> " + page2);
			CategoryDTOVO ticketDTOVO = new CategoryDTOVO();
			ticketDTOVO.setTicketList(ticketList2);
			ticketDTOVO.setPaging(page2);
			ticketDTOVO.setTotalTicket(totalTicket2);
			return ticketDTOVO;
		} 
		
		else {
			System.out.println("Controller all");
			CategoryDTOVO categoryDTOVO = new CategoryDTOVO();
			Paging page = new Paging(0, null);
			categoryDTOVO.setStart(page.getStart());
			categoryDTOVO.setEnd(page.getEnd());
			// 패키지 목록
			List<PkageDTO> pkageList = ss.getPkageList(pkageDTO);
			System.out.println("Controller pkageList -> " + pkageList);
			categoryDTOVO.setPkageList(pkageList);

			// 호텔 목록
			List<HotelDTO> hotelList = ss.getHotelList(hotelDTO);
			System.out.println("Controller hotelList -> " + hotelList);
			categoryDTOVO.setHotelList(hotelList);

			// 입장권 목록
			List<TicketDTO> ticketList = ss.getTicketList(ticketDTO);
			System.out.println("Controller ticketList -> " + ticketList);
			categoryDTOVO.setTicketList(ticketList);


			
			return categoryDTOVO;
		}
	}
	
}
