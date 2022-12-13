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

	@Override
	public List<ManageHotelDTO> getRoomList(ManageHotelDTO hotel) {	
		List<ManageHotelDTO> roomList = dao.getRoomList(hotel);
		return roomList;
	}

	@Override
	public List<ManageHotelDTO> getRoomDetail(ManageHotelDTO hotel) {
		List<ManageHotelDTO> roomDetail = dao.getRoomDetail(hotel);
		return roomDetail;
	}

	@Override
	public int totalroomDetail(ManageHotelDTO hotel) {
		int total = dao.getRoomDetailTotal(hotel);
		return total;
	}

	@Override
	public int updateRoomImg(ManageHotelDTO hotel) {
		int result = dao.updateRoomImg(hotel);
		return result;
	}

	@Override
	public int insertRoomImg(ManageHotelDTO hotel) {
		int result = dao.insertRoomImg(hotel);
		return result;
	}

	@Override
	public int updateDetailRoom(ManageHotelDTO hotel) {
		int result = dao.updateDetailRoom(hotel);
		return result;
	}

	@Override
	public int deleteDetailRoom(ManageHotelDTO hotel) {
		int result = dao.deleteDetailRoom(hotel);
		return result;
	}

	@Override
	public int deleteRoom(ManageHotelDTO hotel) {
		int result = dao.deleteRoom(hotel);
		return result;
	}

	@Override
	public int insertRoom(ManageHotelDTO hotel) {
		int result = dao.insertRoom(hotel);
		return result;
	}

	@Override
	public int getInsertRoom_id() {
		int result = dao.getInsertRoom_id();
		return result;
	}

	@Override
	public int getInsertRoom_detail_id() {
		int result = dao.insertRoom_dt_id();
		return result;
	}

	@Override
	public int insertRoomDetail(ManageHotelDTO hotel) {
		int result = dao.insertRoomDetail(hotel);
		return result;
	}

	
}
