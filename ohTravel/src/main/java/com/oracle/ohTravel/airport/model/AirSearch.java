package com.oracle.ohTravel.airport.model;

import lombok.Data;

@Data
public class AirSearch {
	private int gubun_check;
	private int start_country_id;
	private int end_country_id;
	private int start_city_id;
	private int end_city_id;
	private String start_date1; //왕복 가는날짜
	private String end_date; // 왕복 오는날짜
	private String start_date2; // 편도 가는날짜
	//private int count;
	private String seat_position;
	private String seat_name;
}
