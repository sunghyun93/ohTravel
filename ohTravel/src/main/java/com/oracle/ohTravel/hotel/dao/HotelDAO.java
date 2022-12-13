package com.oracle.ohTravel.hotel.dao;

import java.util.List;

import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.hotel.model.HotelReservationDTO;
import com.oracle.ohTravel.hotel.model.RoomDTO;

public interface HotelDAO {

	List<HotelDTO> hotelList(HotelDTO hoteldto);

	HotelDTO getHotelDetail(HotelDTO hotelDTO);

	List<RoomDTO> getRoomList(RoomDTO roomDTO);

	RoomDTO getRoomDetail(RoomDTO roomDTO);

	String reserveHotel(HotelReservationDTO hotelRDTO);

	String getMembershipInfo(RoomDTO roomDTO);

}