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
}
