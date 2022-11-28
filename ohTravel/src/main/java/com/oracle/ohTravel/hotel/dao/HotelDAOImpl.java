package com.oracle.ohTravel.hotel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.hotel.model.HotelDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class HotelDAOImpl implements HotelDAO {

	private final SqlSession session;

	@Override
	public List<HotelDTO> hotelList(HotelDTO hoteldto) {
		return session.selectList("hotelList");
	}

	@Override
	public HotelDTO getHotelDetail(HotelDTO hotelDTO) {
		return session.selectOne("hotelDetail",hotelDTO);
	}
	
	
}
