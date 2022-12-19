package com.oracle.ohTravel.hotel.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.oracle.ohTravel.basket.model.BasketDTO;
import com.oracle.ohTravel.hotel.dao.HotelDAO;
import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.hotel.model.HotelReservationDTO;
import com.oracle.ohTravel.hotel.model.Hotel_imageDTO;
import com.oracle.ohTravel.hotel.model.RoomDTO;
import com.oracle.ohTravel.member.dao.MemberDao;
import com.oracle.ohTravel.member.model.UpdateMileGradeDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HotelServiceImpl implements HotelService {

	private final HotelDAO hd;
	private final MemberDao memberDao;
	
	@Override
	public List<HotelDTO> hotelList(HotelDTO hoteldto) {
		return hd.hotelList(hoteldto);
	}

	@Override
	public HotelDTO getHotelDetail(HotelDTO hotelDTO) {
		return hd.getHotelDetail(hotelDTO);
	}

	@Override
	public List<RoomDTO> getRoomList(RoomDTO roomDTO) {
		return hd.getRoomList(roomDTO);
	}

	@Override
	public RoomDTO getRoomDetail(RoomDTO roomDTO) {
		return hd.getRoomDetail(roomDTO);
	}

	@Transactional
	@Override
	public String reserveHotel(HotelReservationDTO hotelRDTO) {
		
		try {
			
			//insert hotel_reservation
			hd.insertReserveInfo(hotelRDTO);
			
			System.out.println("호텔예약아이디->"+hotelRDTO.getH_rev_id());
			for(int i = 0; i < hotelRDTO.getCalDate(); i++) {
				 // ${startDate}에서 ${endDate}까지 하루씩 증가하기 위함
				hotelRDTO.setIntervalDay(i);
				// 예약하면서 해당 방의 예약 상태를 N으로 만듦
				 hd.updateReserveStat(hotelRDTO); 
				 hd.insertReserveDetail(hotelRDTO);
			 }
			
			//insert payment 
			hd.insertPayment(hotelRDTO);
			 
			hd.updatemile(hotelRDTO);
			
			//
			UpdateMileGradeDTO updateMile = new UpdateMileGradeDTO();
			updateMile.setMem_id(hotelRDTO.getMem_id());
			memberDao.updateMemMileGrade(updateMile);
			
			// 쿠폰 사용 시 쿠폰 사용내역 update
			if(hotelRDTO.getCoupon_id() != null) {
				Map<String, Object> couponMap = new HashMap<>();
				couponMap.put("mem_id", hotelRDTO.getMem_id());
				couponMap.put("coupon_id", hotelRDTO.getCoupon_id());
				memberDao.updateMemCouponUsed(couponMap);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "FAILED";
		}
		 
		return Integer.toString(hotelRDTO.getH_rev_id());
	}

	@Override
	public RoomDTO getMembershipInfo(RoomDTO roomDTO) {
		return hd.getMembershipInfo(roomDTO);
	}

	@Override
	public String heartBasket(HotelDTO hotelDTO) {

		try {
			
			if( hd.selectBasket(hotelDTO) == null ) {
				
				hd.insertBasket(hotelDTO);
				
				return "INSERT OK!";
				
			} else {

				hd.deleteBasket(hotelDTO);
					
				return "DELETE OK!";
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "FAILED";
		}
		
		
	}

	@Override
	public List<HotelDTO> getHotelSearchResult(HotelDTO hotelDTO) {
		return hd.getHotelSearchResult(hotelDTO);
	}

	@Override
	public List<HotelDTO> getHotelDetailOptions(HotelDTO hotelDTO) {
		return hd.getHotelDetailOptions(hotelDTO);
	}

	@Override
	public List<HotelDTO> getHotelRecList(HotelDTO hotelDTO) {
		return hd.getHotelRecList(hotelDTO);
	}


}
