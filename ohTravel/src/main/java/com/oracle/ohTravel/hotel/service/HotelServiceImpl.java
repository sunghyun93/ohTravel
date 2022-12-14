package com.oracle.ohTravel.hotel.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.ohTravel.hotel.dao.HotelDAO;
import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.hotel.model.HotelReservationDTO;
import com.oracle.ohTravel.hotel.model.RoomDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HotelServiceImpl implements HotelService {

	private final HotelDAO hd;
	
	@Override
	public List<HotelDTO> hotelList(HotelDTO hoteldto) {
		return hd.hotelList(hoteldto);
	}

	@Override
	public HotelDTO getHotelDetail(HotelDTO hotelDTO) {
		return hd.getHotelDetail(hotelDTO);
	}

	@Override
	public List<RoomDTO> getRoomList(RoomDTO roomDTO) {
		return hd.getRoomList(roomDTO);
	}

	@Override
	public RoomDTO getRoomDetail(RoomDTO roomDTO) {
		return hd.getRoomDetail(roomDTO);
	}

	@Override
	public String reserveHotel(HotelReservationDTO hotelRDTO) {
		
		try {
			
			for(int i = 0; i < hotelRDTO.getCalDate(); i++) {
				 // ${startDate}에서 ${endDate}까지 하루씩 증가하기 위함
				hotelRDTO.setIntervalDay(i);
				// 예약하면서 해당 방의 예약 상태를 N으로 만듦
				 hd.updateReserveStat(hotelRDTO); 
				//insert hotel_reservation
				 hd.insertReserveInfo(hotelRDTO);
				//insert payment 
				 hd.insertPayment(hotelRDTO);
			 }
			
			hd.updatemile(hotelRDTO);
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "FAILED";
		}
		 
		return "SUCCESS";
	}

	@Override
	public RoomDTO getMembershipInfo(RoomDTO roomDTO) {
		return hd.getMembershipInfo(roomDTO);
	}

}
