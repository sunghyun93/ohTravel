package com.oracle.ohTravel.ticket.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.ohTravel.ticket.model.TicketDTO;
import com.oracle.ohTravel.ticket.service.Paging;
import com.oracle.ohTravel.ticket.service.TicketService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/ticket")
@RequiredArgsConstructor
@Slf4j
public class TicketController {
	
	private final TicketService ts;
	
	/* 입장권 메인 화면 */
	@GetMapping(value = "/exhibitionMain")
	public String goExhibition(TicketDTO ticketDTO,  Model model) {
		System.out.println("== TicketController Start exhibitionDetail ==");

		// Ticket 전체 Count
		int totalTicket = ts.totalTicket();		
		
		// Paging 작업
		/*
		 * Paging page = new Paging(totalTicket, currentPage);
		 * 
		 * ticketdto.setStart(page.getStart()); ticketdto.setEnd(page.getEnd());
		 */
		
		// 티켓 목록
		List<TicketDTO> ticketList = ts.ticketList(ticketDTO);
		
		model.addAttribute("totalTicket", totalTicket);
		model.addAttribute("ticketList", ticketList);
		//model.addAttribute("page", page);
		
		return "ticket/exhibitionMain";
	}
	
	// 입장권 검색 결과
	@GetMapping(value = "/exhSearchResult")
	public String goExhSearchResult() {
		return "ticket/exhSearchResult";
	}
	
	// 입장권 상세정보
	@GetMapping(value = "/exhibitionDetail")
	public String goExhibitionDetail(String ticket_id, Model model) {
		System.out.println("== TicketController Start exhibitionDetail ==");
		
		TicketDTO ticketDTO = ts.getTicketDetail(ticket_id);
		model.addAttribute("ticketDetail", ticketDTO);
		
		return "ticket/exhibitionDetail";
	}

	
	// 입장권 결제 직전 페이지
	@GetMapping(value = "/exhPayment")
	public String goExhibitionReservation() {
		return "ticket/exhPayment";
	}
}
