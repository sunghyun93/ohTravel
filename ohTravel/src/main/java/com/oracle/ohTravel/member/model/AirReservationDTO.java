package com.oracle.ohTravel.member.model;

import java.sql.Date;

import lombok.Data;

@Data
public class AirReservationDTO {
	private int Reservation_id;
	private String mem_id;
	private String Seat_position;
	private String Start_Airport_name;
	private String End_Airport_name;
	private int Air_num;
	private String Airplane_name;
	private Date Reservation_date;
	private int Reservation_price;
	private int Passport_num;
	
	private String pageNum;  
	private int start;
	private int end;
}
