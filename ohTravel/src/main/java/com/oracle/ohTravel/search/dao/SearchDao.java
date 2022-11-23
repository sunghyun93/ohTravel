package com.oracle.ohTravel.search.dao;

import java.util.List;

import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.ticket.model.TicketModel;

public interface SearchDao {

//	List<TicketModel> getTicketList(String search_word);

	List<PkageDTO> getPkageList(String search_word);
	
}
