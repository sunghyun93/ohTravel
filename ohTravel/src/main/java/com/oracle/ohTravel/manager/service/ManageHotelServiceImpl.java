package com.oracle.ohTravel.manager.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.ohTravel.manager.dao.ManageHotelDAO;
import com.oracle.ohTravel.manager.model.ManageHotelDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ManageHotelServiceImpl implements ManageHotelService{
	
	private final ManageHotelDAO dao;

	@Override
	public List<ManageHotelDTO> getHotelList(ManageHotelDTO hotel) {
		List<ManageHotelDTO> hotelList = dao.getHotelList(hotel);
		return hotelList;
	}

	@Override
	public List<ManageHotelDTO> getHotelDetail(ManageHotelDTO hotel) {
		List<ManageHotelDTO> hotelDetail = dao.getHotelDetail(hotel);
		return hotelDetail;
	}

	@Override
	public List<ManageHotelDTO> getHotelOptionList(ManageHotelDTO hotel) {
		List<ManageHotelDTO> hotelOptionList = dao.gethotelOptionList(hotel);
		return hotelOptionList;
	}

	@Override
	public int updateHotelOptionAjax(ManageHotelDTO hotel) {
		int result = dao.updateHotelOptionAjax(hotel);
		return result;
	}

	@Override
	public int updateHotel(ManageHotelDTO hotel) {
		int result = dao.updateHotel(hotel);
		return result;
	}

	@Override
	public int insertHotel(ManageHotelDTO hotel) {
		int result = dao.insertHotel(hotel);
		return result;
	}

	@Override
	public int totalHotel() {
		int total = dao.totalHotel();
		return total;
	}

	@Override
	public int deleteHotel(ManageHotelDTO hotel) {
		int result = dao.deleteHotel(hotel);
		return result;
	}
}
