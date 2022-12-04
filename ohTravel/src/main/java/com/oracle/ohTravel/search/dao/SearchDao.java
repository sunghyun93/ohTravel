package com.oracle.ohTravel.search.dao;

import java.util.HashMap;
import java.util.List;

import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.ticket.model.TicketDTO;

public interface SearchDao {

//	List<TicketModel> getTicketList(String search_word);

	List<PkageDTO> getPkageList(PkageDTO pkageDTO);

	List<HotelDTO> getHotelList(HotelDTO hotelDTO);

	List<TicketDTO> getTicketList(TicketDTO ticketDTO);

	List<PkageDTO> filteredPkageList(HashMap<String, Object> hm);

	List<HotelDTO> filteredHotelList(HashMap<String, Object> hotelHM);

	
}
