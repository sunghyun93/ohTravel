package com.oracle.ohTravel.hotel.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.ohTravel.hotel.dao.HotelDAO;
import com.oracle.ohTravel.hotel.model.HotelDTO;

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
		System.out.println("getHotelDetail Service Start...");
		return hd.getHotelDetail(hotelDTO);
	}

}
