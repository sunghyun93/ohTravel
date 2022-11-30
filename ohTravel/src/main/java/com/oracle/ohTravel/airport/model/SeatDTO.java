package com.oracle.ohTravel.airport.model;

import lombok.Data;

@Data
public class SeatDTO {
	private String seat_position;
	private int seat_grade;
	private String seat_name;
	private int plus_seat_price;
}
