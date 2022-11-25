package com.oracle.ohTravel.hotel.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class HotelDTO {

	private int hotel_id;
	private int city_id;
	private String hotel_kor;
	private String hotel_eng;
	private String hotel_loc;
	private String hotel_type;
	private int hotel_grade;
	private double hotel_score;
	private String hotel_tel;
	private int hotel_rv_num;
	private Timestamp checkin;
	private Timestamp checkout;
	
	private String h_img_path;
	
	private String city_name;
	
}
