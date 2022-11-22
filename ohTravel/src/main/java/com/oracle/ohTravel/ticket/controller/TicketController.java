package com.oracle.ohTravel.ticket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/ticket")
@RequiredArgsConstructor
public class TicketController {
	
	/* =============== 입장권 =============== */
	@GetMapping(value = "/ticketmain")
	public String goTicket() {
		return "ticket/ticketMain";
	}
	
	// 국내 입장권
	@GetMapping(value = "/ticketDomestic")
	public String goTicketDomestic() {
		return "ticket/ticketDomestic";
	}
	// 해외 입장권
	@GetMapping(value = "/ticketOverseas")
	public String goTicketOverseas() {
		return "ticket/ticketOverseas";
	}
}
