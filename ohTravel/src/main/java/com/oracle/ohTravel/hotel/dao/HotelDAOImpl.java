package com.oracle.ohTravel.hotel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.hotel.model.HotelReservationDTO;
import com.oracle.ohTravel.hotel.model.RoomDTO;

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

	@Override
	public List<RoomDTO> getRoomList(RoomDTO roomDTO) {
		return session.selectList("roomList",roomDTO);
	}

	@Override
	public RoomDTO getRoomDetail(RoomDTO roomDTO) {
		return session.selectOne("roomDetailList",roomDTO);
	}

	@Override
	public String reserveHotel(HotelReservationDTO hotelRDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getMembershipInfo(String mem_id) {
		return session.selectOne("membershipInfo", mem_id);
	}

	@Override
	public void updateReserveStat(HotelReservationDTO hotelRDTO) {
			session.update("updateReserveStat", hotelRDTO);
	}

	@Override
	public void insertReserveInfo(HotelReservationDTO hotelRDTO) {
		session.insert("insertReserveInfo", hotelRDTO);
	}

	@Override
	public void insertPayment(HotelReservationDTO hotelRDTO) {
		session.insert("insertHotelPayment", hotelRDTO);
		
	}
	
	
}
