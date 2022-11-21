package com.oracle.ohTravel.search.dao;

import java.util.List;

import com.oracle.ohTravel.ticket.model.TicketModel;

public interface SearchDao {

	List<TicketModel> getSearchResult(String search_word);

}
