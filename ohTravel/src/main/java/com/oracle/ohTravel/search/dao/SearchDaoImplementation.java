package com.oracle.ohTravel.search.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.ticket.model.TicketDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class SearchDaoImplementation implements SearchDao {

	private final SqlSession sqs;

	// 패키지 목록 가져와
	@Override
	public List<PkageDTO> getPkageList(PkageDTO pkageDTO) {
		System.out.println("Dao getPkageList Start...");
		List<PkageDTO> pkageList = null;
		try {
			pkageList = sqs.selectList("yqPkageList", pkageDTO);
		} catch (Exception e) {
			System.out.println("Dao getPkageList Exception -> " + e.getMessage());
		}
		System.out.println("start -> " + pkageDTO.getStart());
		System.out.println("end -> " + pkageDTO.getEnd());
		return pkageList;
	}
		
	// 티켓 목록 가져와
	@Override
	public List<TicketDTO> getTicketList(TicketDTO ticketDTO) {
		System.out.println("Dao getTicketList Start...");
		List<TicketDTO> ticketList = null;
		try {
			ticketList = sqs.selectList("yqTicketList", ticketDTO);
		} catch (Exception e) {
			System.out.println("Dao getTicketList Exception -> " + e.getMessage());
		}
		return ticketList;
	}

	// 호텔 목록 가져와
	@Override
	public List<HotelDTO> getHotelList(HotelDTO hotelDTO) {
		System.out.println("Dao getHotelList Start...");
		List<HotelDTO> hotelList = null;
		try {
			hotelList = sqs.selectList("yqHotelList", hotelDTO);
		} catch (Exception e) {
			System.out.println("Dao getHotelList Exception -> " + e.getMessage());
		}
		return hotelList;
	}

	@Override
	public List<PkageDTO> filteredPkageList(HashMap<String, Object> pkageHM) {
		System.out.println("Dao filteredPkageList Start...");
		List<PkageDTO> filteredPkageList = null;
		try {
			filteredPkageList = sqs.selectList("yqFilteredPkageList", pkageHM);
		} catch (Exception e) {
			System.out.println("Dao filteredPkageList Exception -> " + e.getMessage());
		}
		return filteredPkageList;
	}

	@Override
	public List<HotelDTO> filteredHotelList(HashMap<String, Object> hotelHM) {
		System.out.println("Dao filteredHotelList Start...");
		List<HotelDTO> filteredHotelList = null;
		try {
			filteredHotelList = sqs.selectList("yqFilteredHotelList", hotelHM);
		} catch (Exception e) {
			System.out.println("Dao filteredHotelList Exception -> " + e.getMessage());
		}
		return filteredHotelList;
	}

	@Override
	public int insertFavorite(PkageDTO pkageDTO) {
		System.out.println("Dao insertFavorite Start...");
		int insertFavorite = 0;
		try {
			insertFavorite = sqs.insert("yqInsertFavorite", pkageDTO);
		} catch (Exception e) {
			System.out.println("Dao insertFavorite Exception -> " + e.getMessage());
		}
		return insertFavorite;
	}
	
}
