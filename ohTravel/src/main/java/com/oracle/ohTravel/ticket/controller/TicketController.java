package com.oracle.ohTravel.ticket.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.ohTravel.member.model.MemberDTO;
import com.oracle.ohTravel.ticket.model.TicketDTO;
import com.oracle.ohTravel.ticket.model.TicketReservation;
import com.oracle.ohTravel.ticket.service.Paging;
import com.oracle.ohTravel.ticket.service.TicketService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/ticket")
@RequiredArgsConstructor
@Slf4j
public class TicketController {
	
	@Autowired
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

	
	/* 1트) 입장권 예약 페이지 */
	@GetMapping(value = "/exhPayment")
	public String goExhibitionReservation() {
		return "ticket/exhPayment";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 2트) 입장권 예약 페이지
	@GetMapping("/reservation")
	public String ticketReservation(TicketReservation tcReserve, Model model, HttpServletRequest request, HttpSession session) {
		log.info("== TicketController reservation() start ==");
		log.info("tcReserve = " + tcReserve);
		
		// 데이터 전달 확인 검사
		if(tcReserve.getTicket_order_id() == null) {
			String url = request.getRequestURI();
			return "redirect:" + url;
		}
		
		// 현재 로그인하고 있는 사용자 정보
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("res");
		log.info("memberDTO = " + memberDTO);
		
		if(memberDTO == null) {
			return "redirect:/member/loginForm";
		}
		
		try {
			// 입장권 상세 가져오기
			TicketDTO ticket_detailDTO = ts.getTicketDetail(tcReserve.getTicket_id());
			
			// 총 가격 만들어주기
			tcReserve.makeTotalPay(ticket_detailDTO.getTicket_adult_price(), ticket_detailDTO.getTicket_child_price());
			
			model.addAttribute("ticket_detailDTO", ticket_detailDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("tcReserve", tcReserve);
		log.info("== TicketController reservation() end ==");
		return "ticket/reservation";
	}
}
