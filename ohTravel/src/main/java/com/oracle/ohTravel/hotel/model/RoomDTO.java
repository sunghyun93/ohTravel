package com.oracle.ohTravel.hotel.model;

import lombok.Data;

@Data
public class RoomDTO {
	
	private int room_id;
	private String hotel_id;
	private String room_type;
	private int room_per;
	private String room_name;
}
