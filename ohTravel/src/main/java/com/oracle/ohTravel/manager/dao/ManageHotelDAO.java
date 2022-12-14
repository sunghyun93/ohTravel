package com.oracle.ohTravel.manager.dao;

import java.util.List;

import com.oracle.ohTravel.manager.model.ManageHotelDTO;

public interface ManageHotelDAO {

	List<ManageHotelDTO> getHotelList(ManageHotelDTO hotel);

	List<ManageHotelDTO> getHotelDetail(ManageHotelDTO hotel);

	List<ManageHotelDTO> gethotelOptionList(ManageHotelDTO hotel);

	int updateHotelOptionAjax(ManageHotelDTO hotel);

	int updateHotel(ManageHotelDTO hotel);

	int insertHotel(ManageHotelDTO hotel);

	int totalHotel();

	int deleteHotel(ManageHotelDTO hotel);

	List<ManageHotelDTO> getRoomList(ManageHotelDTO hotel);

	List<ManageHotelDTO> getRoomDetail(ManageHotelDTO hotel);

	int getRoomDetailTotal(ManageHotelDTO hotel);

	int updateRoomImg(ManageHotelDTO hotel);

	int insertRoomImg(ManageHotelDTO hotel);

	int updateDetailRoom(ManageHotelDTO hotel);

	int deleteDetailRoom(ManageHotelDTO hotel);

	int deleteRoom(ManageHotelDTO hotel);

	int insertRoom(ManageHotelDTO hotel);

	int getInsertRoom_id();

	int insertRoom_dt_id();

	int insertRoomDetail(ManageHotelDTO hotel);


}
