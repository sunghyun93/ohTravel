package com.oracle.ohTravel.manager.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.manager.model.ManageHotelDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ManageHotelDAOImpl implements ManageHotelDAO{
	
	private final SqlSession session;

	@Override
	public List<ManageHotelDTO> getHotelList(ManageHotelDTO hotel) {
		List<ManageHotelDTO> hotelList = session.selectList("getHotelList", hotel);
		return hotelList;
	}

	@Override
	public List<ManageHotelDTO> getHotelDetail(ManageHotelDTO hotel) {
		List<ManageHotelDTO> hotelDetail = session.selectList("getHotelDetail", hotel);
		return hotelDetail;
	}

	@Override
	public List<ManageHotelDTO> gethotelOptionList(ManageHotelDTO hotel) {
		List<ManageHotelDTO> hotelOptionList = session.selectList("getHotelOptionList", hotel);
		return hotelOptionList;
	}

	@Override
	public int updateHotelOptionAjax(ManageHotelDTO hotel) {
		int result = session.update("updateHotelOptionAjax", hotel);
		return result;
	}

	@Override
	public int updateHotel(ManageHotelDTO hotel) {
		int result = session.update("updateHotel", hotel);
		return result;
	}

	@Override
	public int insertHotel(ManageHotelDTO hotel) {
		int result = session.insert("insertHotel", hotel);
		return result;
	}

	@Override
	public int totalHotel() {
		int total = session.selectOne("totalHotel");
		return total;
	}

	@Override
	public int deleteHotel(ManageHotelDTO hotel) {
		int result = session.delete("deleteHotel", hotel);
		return result;
	}

	@Override
	public List<ManageHotelDTO> getRoomList(ManageHotelDTO hotel) {
		List<ManageHotelDTO> roomList = session.selectList("getRoomList", hotel);
		return roomList;
	}

	@Override
	public List<ManageHotelDTO> getRoomDetail(ManageHotelDTO hotel) {
		List<ManageHotelDTO> roomDetail = session.selectList("getRoomDetail", hotel);
		return roomDetail;
	}

	@Override
	public int getRoomDetailTotal(ManageHotelDTO hotel) {
		int total = session.selectOne("getRoomDetailTotal", hotel);
		return total;
	}

	@Override
	public int updateRoomImg(ManageHotelDTO hotel) {
		int result = session.update("updateRoomImg", hotel);
		return result;
	}

	@Override
	public int insertRoomImg(ManageHotelDTO hotel) {
		int result = session.insert("insertRoomImg", hotel);
		return result;
	}

	@Override
	public int updateDetailRoom(ManageHotelDTO hotel) {
		int result = session.update("updateDetailRoom", hotel);
		return result;
	}

	@Override
	public int deleteDetailRoom(ManageHotelDTO hotel) {
		int result = session.delete("deleteDetailRoom", hotel);
		return result;
	}

	@Override
	public int deleteRoom(ManageHotelDTO hotel) {
		int result = session.delete("deleteRoom", hotel);
		return result;
	}

	@Override
	public int insertRoom(ManageHotelDTO hotel) {
		int result = session.insert("insertRoom", hotel);
		return result;
	}

	@Override
	public int getInsertRoom_id() {
		int result = session.selectOne("getInsertRoom_id");
		System.out.println("DAO result ->"+result);
		return result;
	}

	@Override
	public int insertRoom_dt_id() {
		int result = session.selectOne("getInsertRoom_dt_id");
		return result;
	}

	@Override
	public int insertRoomDetail(ManageHotelDTO hotel) {
		int result = session.insert("insertRoomDetail", hotel);
		return result;
	}

}
