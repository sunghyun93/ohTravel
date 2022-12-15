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

	// 호텔 전체 목록 조회
	@Override
	public List<HotelDTO> hotelList(HotelDTO hoteldto) {
		return session.selectList("hotelList");
	}
	
	// 호텔 상세 정보 조회
	@Override
	public HotelDTO getHotelDetail(HotelDTO hotelDTO) {
		return session.selectOne("hotelDetail",hotelDTO);
	}

	// 예약 가능한 방 조회
	@Override
	public List<RoomDTO> getRoomList(RoomDTO roomDTO) {
		return session.selectList("roomList",roomDTO);
	}
	
	// 방 하나의 상세 정보 조회
	@Override
	public RoomDTO getRoomDetail(RoomDTO roomDTO) {
		return session.selectOne("roomDetailList",roomDTO);
	}

	// 예약할 때, 회원의 멤버십 정보 조회
	@Override
	public RoomDTO getMembershipInfo(RoomDTO roomDTO) {
		return session.selectOne("membershipInfo", roomDTO);
	}
	
	// 예약하면서 예약 상태 Y -> N으로 변경
	@Override
	public void updateReserveStat(HotelReservationDTO hotelRDTO) {
			session.update("updateReserveStat", hotelRDTO);
	}

	// hotel_reservation 테이블 insert
	@Override
	public void insertReserveInfo(HotelReservationDTO hotelRDTO) {
		session.insert("insertReserveInfo", hotelRDTO);
	}

	// payment 테이블 insert
	@Override
	public void insertPayment(HotelReservationDTO hotelRDTO) {
		session.insert("insertHotelPayment", hotelRDTO);
		
	}

	@Override
	public void updatemile(HotelReservationDTO hotelRDTO) {
		session.update("updateMemberMile", hotelRDTO);
		
	}
	
	
}
