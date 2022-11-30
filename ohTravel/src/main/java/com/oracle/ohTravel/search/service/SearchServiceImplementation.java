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
	public List<PkageDTO> getPkageList(PkageDTO pkageDTO) {
		System.out.println("Service getPkageList Start...");
		List<PkageDTO> pkageList = sd.getPkageList(pkageDTO);
		return pkageList;
	}

	@Override
	public List<HotelDTO> getHotelList(PkageDTO pkageDTO) {
		System.out.println("Service getHotelList Start...");
		List<HotelDTO> hotelList = sd.getHotelList(pkageDTO);
		return hotelList;
	}

	@Override
	public List<TicketDTO> getTicketList(PkageDTO pkageDTO) {
		System.out.println("Service getTicketList Start...");
		List<TicketDTO> ticketList = sd.getTicketList(pkageDTO);
		return ticketList;
	}

	@Override
	public List<PkageDTO> filteredPkageList(PkageDTO pkageDTO) {
		List<PkageDTO> filteredPkageList = sd.filteredPkageList(pkageDTO);
		return filteredPkageList;
	}

	@Override
	public List<HotelDTO> filteredHotelList(HotelDTO hotelDTO) {
		return null;
	}

	
}
