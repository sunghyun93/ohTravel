package com.oracle.ohTravel.airport.model;

import lombok.Data;

@Data
public class AirSearch {
	private Integer gubun_check;
	private Integer start_country_id;
	private String start_city_name;
	private Integer end_country_id;
	private String end_city_name;
	private Integer start_city_id;
	private Integer end_city_id;
	private String start_date1; //왕복 가는날짜
	private String end_date; // 왕복 오는날짜
	private String start_date2; // 편도 가는날짜
	private Integer count; //인원수
	private String seat_position;
	private String seat_name;
	
	private Integer order; // 1,2,3 인지 알수있게
}
