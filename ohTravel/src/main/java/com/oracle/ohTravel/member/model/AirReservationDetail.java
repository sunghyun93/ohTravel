package com.oracle.ohTravel.member.model;

import java.util.Date;

import lombok.Data;

@Data
public class AirReservationDetail {
	private Date reservation_date;
	private Integer reservation_id;
	private String mem_id;
	private String seat_position;
	private Integer reservation_price;
	private Integer schedule_price;
	private Date start_time;
	private String start_airport_name;
	private String end_airport_name;
	private String airplane_name;
	
	
}
