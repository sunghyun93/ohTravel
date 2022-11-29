package com.oracle.ohTravel.search.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.search.dao.SearchDao;
import com.oracle.ohTravel.ticket.model.TicketDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SearchServiceImplementation implements SearchService {
	
	private final SearchDao sd;
	
	@Override
	public List<HotelDTO> getHotelList(String search_word) {
		System.out.println("Service getHotelList Start...");
		List<HotelDTO> hotelList = sd.getHotelList(search_word);
		return hotelList;
	}

	@Override
	public List<PkageDTO> getPkageList(String search_word) {
		System.out.println("Service getPkageList Start...");
		List<PkageDTO> pkageList = sd.getPkageList(search_word);
		return pkageList;
	}

	@Override
	public List<TicketDTO> getTicketList(String search_word) {
		System.out.println("Service getTicketList Start...");
		List<TicketDTO> ticketList = sd.getTicketList(search_word);
		return ticketList;
	}

	
}
