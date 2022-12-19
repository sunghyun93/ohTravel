package com.oracle.ohTravel.hotel.model;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.LocalTime;

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
	private String hotel_tel;
	private int room_cnt;
	@JsonFormat(pattern = "HH:mm", timezone = "Asia/Seoul")
	private LocalTime checkin;
	@JsonFormat(pattern = "HH:mm", timezone = "Asia/Seoul")
	private LocalTime checkout;
	private double hotel_score;
	
	private String h_img_path;
	private String room_name;
	private int room_min_price;
	private String room_type;
	
	private String search_word;
	private String pageNum;
	private int start;
	private int end;
	private String city_name;
	private String country_name;
	private String country_id;
	private String mem_id;
	private int review_cnt;
	private int chk;
	private String check;
	private String radioCheck;
	
}
