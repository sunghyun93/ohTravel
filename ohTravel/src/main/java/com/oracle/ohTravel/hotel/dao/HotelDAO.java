package com.oracle.ohTravel.hotel.dao;

import java.util.List;

import com.oracle.ohTravel.basket.model.BasketDTO;
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

	void insertReserveDetail(HotelReservationDTO hotelRDTO);

	HotelDTO selectBasket(HotelDTO hotelDTO);

	void insertBasket(HotelDTO hotelDTO);

	void deleteBasket(HotelDTO hotelDTO);

	List<HotelDTO> getHotelSearchResult(HotelDTO hotelDTO);

	List<HotelDTO> getHotelDetailOptions(HotelDTO hotelDTO);

	List<HotelDTO> getHotelRecList(HotelDTO hotelDTO);


}