package com.oracle.ohTravel.search.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.oracle.ohTravel.search.service.SearchService;
import com.oracle.ohTravel.ticket.model.TicketModel;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SearchController {
	
	private final SearchService ss;
	
	// ticket 리스트
	@GetMapping("/search/searchResult")
	public String searchResult(String search_word, Model model) {
		System.out.println("Controller SearchResultPage Start...");
		List<TicketModel> ticketList = ss.getTicketList(search_word);
		model.addAttribute("ticketList", ticketList);
		
		return "/searchResultPage";
	}
}
