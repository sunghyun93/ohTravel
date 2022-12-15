package com.oracle.ohTravel.hotel.dao;

import java.util.List;

import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.hotel.model.HotelReservationDTO;
import com.oracle.ohTravel.hotel.model.Hotel_imageDTO;
import com.oracle.ohTravel.hotel.model.RoomDTO;

public interface HotelDAO {

	List<HotelDTO> hotelList(HotelDTO hoteldto);

	HotelDTO getHotelDetail(HotelDTO hotelDTO);

	List<RoomDTO> getRoomList(RoomDTO roomDTO);

	RoomDTO getRoomDetail(RoomDTO roomDTO);

	RoomDTO getMembershipInfo(RoomDTO roomDTO);

	void updateReserveStat(HotelReservationDTO hotelRDTO);

	void insertReserveInfo(HotelReservationDTO hotelRDTO);

	void insertPayment(HotelReservationDTO hotelRDTO);

	void updatemile(HotelReservationDTO hotelRDTO);


}