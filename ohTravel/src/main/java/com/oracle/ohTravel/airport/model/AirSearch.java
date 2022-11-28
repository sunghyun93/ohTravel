package com.oracle.ohTravel.airport.model;

import lombok.Data;

@Data
public class AirSearch {
	private int start_country_id;
	private int end_country_id;
	private int start_city_id;
	private int end_city_id;
	private String start_date1;
	private String end_date;
	private String start_date2;
	//private int count;
	private String seat_position;
	private String seat_name;
}
