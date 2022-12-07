package com.oracle.ohTravel.hotel.model;

import java.util.Date;

import lombok.Data;

@Data
public class RoomDetailDTO {

	
	private int room_detail_id;
	private int room_id;
	private Date room_date;
	private int room_price;
	private String room_rev;
	
}
