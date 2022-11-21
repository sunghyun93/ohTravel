package com.oracle.ohTravel.search.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.ohTravel.search.dao.SearchDao;
import com.oracle.ohTravel.ticket.model.TicketModel;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SearchServiceImplementation implements SearchService {
	
	private final SearchDao sd;

	@Override
	public List<TicketModel> getTicketList(String search_word) {
		System.out.println("Service getSearchResult Start...");
		List<TicketModel> ticketList = sd.getSearchResult(search_word);
		return ticketList;
	}
	
	
}
