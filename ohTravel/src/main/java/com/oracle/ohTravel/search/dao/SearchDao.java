package com.oracle.ohTravel.search.dao;

import java.util.List;

import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.ticket.model.TicketDTO;

public interface SearchDao {

//	List<TicketModel> getTicketList(String search_word);

	List<PkageDTO> getPkageList(PkageDTO pkageDTO);

	List<HotelDTO> getHotelList(PkageDTO pkageDTO);

	List<TicketDTO> getTicketList(PkageDTO pkageDTO);

	List<PkageDTO> filteredPkageList(PkageDTO pkageDTO);

	
}
