package com.oracle.ohTravel.ticket.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.ohTravel.member.model.MemberDTO;
import com.oracle.ohTravel.ticket.model.TicketDTO;
import com.oracle.ohTravel.ticket.model.TicketReservation;
import com.oracle.ohTravel.ticket.service.Paging;
import com.oracle.ohTravel.ticket.service.TicketService;

import lombok.RequiredArgsConstructor;
import lombok.Value;
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
	
	// 입장권 검색 결과 (안 할 수도...)
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
		model.addAttribute("rv_real_id", ticketDTO.getTicket_id());
		return "ticket/exhibitionDetail";
	}

	
	/* 입장권 예약 페이지 (실제 예약 X. 전 페이지에서 필요한 정보만 가져오는) */
	@PostMapping(value = "/exhPayment")
	public String goExhibitionReservation(TicketDTO ticketDTO, Model model) {
		
		model.addAttribute("ticket_id", ticketDTO.getTicket_id());
		model.addAttribute("ticket_name", ticketDTO.getTicket_name());
		model.addAttribute("totalPay", ticketDTO.getTotalPay());
		model.addAttribute("adultCnt", ticketDTO.getAdultCnt());
		model.addAttribute("childCnt",  ticketDTO.getChildCnt());
		model.addAttribute("adDate", ticketDTO.getAdDate());

		return "ticket/exhPayment";
	}
	
	/* 실제 결제 */
	@PostMapping(value = "/realReserve")
	public String reserveExhibition(TicketReservation trDTO) {
		System.out.println("== TicketController Start reserveExhibition ==");

		ts.reserveExhibition(trDTO);

		System.out.println(trDTO);
		//@Value("${ticket_admission_date}")
		
		return "ticket/exhReserveSuccess";
	}
}
