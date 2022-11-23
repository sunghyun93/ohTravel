package com.oracle.ohTravel.search.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.search.dao.SearchDao;
import com.oracle.ohTravel.ticket.model.TicketModel;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SearchServiceImplementation implements SearchService {
	
	private final SearchDao sd;

//	@Override
//	public List<TicketModel> getTicketList(String search_word) {
//		System.out.println("Service getSearchResult Start...");
//		List<TicketModel> ticketList = sd.getTicketList(search_word);
//		return ticketList;
//	}
	
//	@Override
//	public List<Hotel> getHotelList(String search_word) {
//		List<Hotel> hotelList = sd.getHotelList(search_word);
//		return hotelList;
//	}

	@Override
	public List<PkageDTO> getPkageList(String search_word) {
		List<PkageDTO> pkageList = sd.getPkageList(search_word);
		return pkageList;
	}

	
}
