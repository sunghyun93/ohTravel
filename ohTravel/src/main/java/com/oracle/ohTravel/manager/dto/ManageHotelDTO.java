package com.oracle.ohTravel.manager.dto;

import java.sql.Date;
import java.sql.Time;

import lombok.Data;

@Data
public class ManageHotelDTO {
	private int hotel_id;
	private String hotel_kor;
	private String hotel_eng;
	private String hotel_loc;
	private String hotel_type;
	private int hotel_grade;
	private String hotel_score;
	private String hotel_tel;
	private int hotel_rv_num;
	private String hotel_theme;
	private Time checkin;
	private Time checkout;
	
	//도시국가
	private int city_id;
	private int country_id;
	private String city_name;
	private String country_name;
	
	//업체 이미지
	private int h_img_id;
	private String h_l_img_path;
	private String h_s_img_path;
	
	//객실
	private int room_id;
	private String room_type;
	private String room_name;
	
	//객실이미지
	private int r_img_id;
	private String r_l_img_path;
	private String r_s_img_path;
	
	//객실상세
	private int room_detail_id;
	private Date room_date;
	private int room_price;
	private int room_per;
	private String room_rev;
}
