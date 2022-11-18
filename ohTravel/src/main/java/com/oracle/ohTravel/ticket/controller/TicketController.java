package com.oracle.ohTravel.ticket.controller;

import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class TicketController {
	
	/* =============== 입장권 =============== */
	@GetMapping(value = "ticketmain")
	public String goTicket() {
		return "ticket/ticketMain";
	}
	
	// 국내 입장권
	@GetMapping(value = "ticketDomestic")
	public String goTicketDomestic() {
		return "ticket/ticketDomestic";
	}
	// 해외 입장권
	@GetMapping(value = "ticketOverseas")
	public String goTicketOverseas() {
		return "ticket/ticketOverseas";
	}
}
