package com.oracle.ohTravel.search.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.ticket.model.TicketModel;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class SearchDaoImplementation implements SearchDao {

	private final SqlSession sqs;

//	// 티켓 목록 가져와
//	@Override
//	public List<TicketModel> getTicketList(String search_word) {
//		System.out.println("Dao getSearchResult Start...");
//		List<TicketModel> ticketList = null;
//		try {
//			ticketList = sqs.selectList("yqTicketList", search_word);
//		} catch (Exception e) {
//			System.out.println("Dao getTicketList Exception -> " + e.getMessage());
//		}
//		return ticketList;
//	}

//	// 패키지 목록 가져와
//	@Override
//	public List<Hotel> getHotelList(String search_word) {
//		List<Hotel> pkageList = null;
//		try {
//			pkageList = sqs.selectList("yqHotelList", search_word);
//		} catch (Exception e) {
//			System.out.println("Dao getHotelList Exception -> " + e.getMessage());
//		}
//		return hotelList;
//	}

	// 패키지 목록 가져와
	@Override
	public List<PkageDTO> getPkageList(String search_word) {
		List<PkageDTO> pkageList = null;
		try {
			pkageList = sqs.selectList("yqPkageList", search_word);
		} catch (Exception e) {
			System.out.println("Dao getPkageList Exception -> " + e.getMessage());
		}
		return pkageList;
	}
	
}
