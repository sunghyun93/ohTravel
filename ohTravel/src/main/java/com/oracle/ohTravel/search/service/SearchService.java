package com.oracle.ohTravel.search.service;

import java.util.List;

import com.oracle.ohTravel.ticket.model.TicketModel;

public interface SearchService {

	List<TicketModel> getTicketList(String search_word);

}
