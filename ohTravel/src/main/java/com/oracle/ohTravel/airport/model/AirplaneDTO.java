package com.oracle.ohTravel.airport.model;

import lombok.Data;

@Data
public class AirplaneDTO {
	private String airplane_name;
	private int general_seat;
	private int business_seat;
	private int first_seat;
	
}
