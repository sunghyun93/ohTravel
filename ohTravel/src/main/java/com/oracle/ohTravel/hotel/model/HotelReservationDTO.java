package com.oracle.ohTravel.hotel.model;

import java.sql.Date;

import lombok.Data;

@Data
public class HotelReservationDTO {
	private int h_rev_id;
	private String mem_id;
	private int room_detail_id;
	private String rev_stat;
	private int rev_per;
	private Date rev_date;
	private int rev_tot_price;
	
	private String startDate;
	private String endDate;
	private int calDate;
	private int canRevDateCnt;
	
	//
	private int intervalDay;
	private int room_id;
	private int numberOfPeople;
	
}
