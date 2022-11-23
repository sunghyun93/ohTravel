package com.oracle.ohTravel.hotel.service;

import java.util.List;

import com.oracle.ohTravel.hotel.model.HotelDTO;

public interface HotelService {

	List<HotelDTO> hotelList(HotelDTO hoteldto);

}
