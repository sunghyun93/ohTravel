package com.oracle.ohTravel.airport.model;

import lombok.Data;

@Data
public class Reservation_Seat {
	private int reservation_id;
	private String airplane_name;
	private String seat_position;
	private int seat_status;
}
