package com.oracle.ohTravel.airport.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Air_ReservationDTO {
	private int reservation_id;
	private String mem_id;
	private String seat_position;
	private Date reservation_date;
	private int reservation_price;
	
}
