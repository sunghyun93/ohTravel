package com.oracle.ohTravel.search.service;

import java.util.HashMap;
import java.util.List;

import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.ticket.model.TicketDTO;

public interface SearchService {

//	List<TicketModel> getTicketList(String search_word);

	List<PkageDTO> getPkageList(PkageDTO pkageDTO);

	List<HotelDTO> getHotelList(HotelDTO hotelDTO);

	List<TicketDTO> getTicketList(TicketDTO ticketDTO);

	List<PkageDTO> filteredPkageList(HashMap<String, Object> pkageHM);

	List<HotelDTO> filteredHotelList(HashMap<String, Object> hotelHM);

	int insertFavorite(PkageDTO pkageDTO);

}
