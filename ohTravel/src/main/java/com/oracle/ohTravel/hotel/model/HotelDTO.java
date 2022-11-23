package com.oracle.ohTravel.hotel.model;

import lombok.Data;

@Data
public class HotelDTO {

	private String hotel_id;
	private int city_id;
	private String hotel_kor;
	private String hotel_eng;
	private String hotel_loc;
	private String hotel_type;
	private int hotel_grade;
	private double hotel_score;
	private String hotel_tel;
	private int hotel_rv_num;
	
}
