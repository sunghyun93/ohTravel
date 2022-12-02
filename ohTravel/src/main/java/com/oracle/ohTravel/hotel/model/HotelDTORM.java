package com.oracle.ohTravel.hotel.model;

import java.util.List;

import lombok.Data;

@Data
public class HotelDTORM {
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
	
	// 호텔 이미지
	private Hotel_imageDTO hotel_imageDTO;
	
	// 호텔 옵션
	private List<Hotel_optionDTO> hotel_optionDTOList;
}
