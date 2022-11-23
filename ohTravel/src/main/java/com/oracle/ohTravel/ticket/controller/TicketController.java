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
	@GetMapping(value = "/exhibitionMain")
	public String goExhibition() {
		return "ticket/exhibitionMain";
	}
	
	// 입장권 검색 결과
	@GetMapping(value = "/exhibitionSearch")
	public String goExhibitionSearch() {
		return "ticket/exhibitionSearch";
	}
	
	// 입장권 상세정보
	@GetMapping(value = "/exhibitionDetail")
	public String goExhibitionDetail() {
		return "ticket/exhibitionDetail";
	}
	
	
	@GetMapping(value = "/exhSearchResult")
	public String goExhSearchResult() {
		return "ticket/exhSearchResult";
	}
}
