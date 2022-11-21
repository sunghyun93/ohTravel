package com.oracle.ohTravel.search.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.ticket.model.TicketModel;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class SearchDaoImplementation implements SearchDao {
	
	private final SqlSession sqs;

	@Override
	public List<TicketModel> getSearchResult(String search_word) {
		System.out.println("Dao getSearchResult Start...");
		List<TicketModel> ticketList = null;
		try {
			ticketList = sqs.selectList("yqTicketList", search_word);
		} catch (Exception e) {
			System.out.println("Dao getSearchResult Exception -> " + e.getMessage());
		}
		return ticketList;
	}
	
	
}
