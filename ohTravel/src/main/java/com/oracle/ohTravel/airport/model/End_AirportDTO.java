package com.oracle.ohTravel.airport.model;

import lombok.Data;

@Data
public class End_AirportDTO {
	private String end_airport_name;
	private int country_id;
	private String country_name;
	private int city_id;
	private String city_name;
}
