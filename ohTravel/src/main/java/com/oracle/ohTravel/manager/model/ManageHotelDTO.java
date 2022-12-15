package com.oracle.ohTravel.manager.model;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalTime;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ManageHotelDTO {
	private String hotel_id;
	private String hotel_kor;
	private String hotel_eng;
	private String hotel_loc;
	private String hotel_type;
	private int hotel_grade;
	private String hotel_tel;
	private int room_cnt;
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern = "HH:mm", timezone = "Asia/Seoul")
	private String checkin;
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern = "HH:mm", timezone = "Asia/Seoul")
	private String checkout;
	
	//호텔 시설 옵션
	private int option_id;
	private String hotel_option;
	private String option_gubun;
	private String hotel_exist;
	
	//도시국가
	private int city_id;
	private int country_id;
	private String city_name;
	private String country_name;
	
	//업체 이미지
	private int h_img_id;
	private String h_img_path;
	
	//객실
	private int room_id;
	private String room_type;
	private String room_name;
	private int room_per;
	
	//객실이미지
	private int r_img_id;
	private String r_img_path;
	
	//객실상세
	private int room_detail_id;
	private Date room_date;
	private int room_price;
	private String room_rev;
	
	
	//호텔옵션용
	private String wifi; 
	private String smoke;
	private String restaurant;
	private String parking;
	private String shopping;
	private String charging_station;
	private String bath;
	private String coffee;
	private String roomservice;
	private String disabled;
	private String balcony;
	private String safe;
	private String[] optionName = {"wifi","흡연가능","레스토랑","주차","쇼핑시설","전기차 충전소","욕실용품","커피 메이커","룸서비스","장애인 편의시설","발코니/테라스","안전금고"};
	private String[] optionArray;
	
	//예약
	private int h_rev_id;
	private String mem_id;
	private String rev_stat;
	private int rev_per;
	private Date rev_date;
	private int rev_tot_price;
	
	//조회용
	private String search;   	private String keyword;
	private String pageNum;  
	private int start;
	private int end;
}
