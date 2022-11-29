package com.oracle.ohTravel.hotel.dao;

import java.util.List;

import com.oracle.ohTravel.hotel.model.HotelDTO;

public interface HotelDAO {

	List<HotelDTO> hotelList(HotelDTO hoteldto);

	HotelDTO getHotelDetail(HotelDTO hotelDTO);

}