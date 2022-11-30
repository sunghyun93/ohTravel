package com.oracle.ohTravel.pkage.model;

import com.oracle.ohTravel.hotel.model.HotelDTO;

import lombok.Data;

@Data
public class Pkage_hotelDTO {
	private Integer pkage_dt_id;	// 패키지 상세
	private String hotel_id;		// 호텔ID
	
	// hotel 호텔
	private HotelDTO hotelDTO;		
}
