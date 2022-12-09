package com.oracle.ohTravel.manager.service;

import java.util.List;

import com.oracle.ohTravel.manager.model.ManageHotelDTO;

public interface ManageHotelService {

	List<ManageHotelDTO> getHotelList(ManageHotelDTO hotel);

	List<ManageHotelDTO> getHotelDetail(ManageHotelDTO hotel);

	List<ManageHotelDTO> getHotelOptionList(ManageHotelDTO hotel);

	int updateHotelOptionAjax(ManageHotelDTO hotel);

	int updateHotel(ManageHotelDTO hotel);

	int insertHotel(ManageHotelDTO hotel);

	int totalHotel();

	int deleteHotel(ManageHotelDTO hotel);
	
}
