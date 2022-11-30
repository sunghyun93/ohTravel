package com.oracle.ohTravel.hotel.model;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	@JsonFormat(pattern = "HH:mm", timezone = "Asia/Seoul")
	private LocalDateTime checkin;
	@JsonFormat(pattern = "HH:mm", timezone = "Asia/Seoul")
	private LocalDateTime checkout;
	
	private String h_img_path;
	private String room_name;
	private int room_min_price;
	private String room_type;
	
	private String pageNum;
	private int start;
	private int end;
	private String city_name;
	
}
