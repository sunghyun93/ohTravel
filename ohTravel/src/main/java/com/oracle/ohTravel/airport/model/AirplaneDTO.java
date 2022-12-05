package com.oracle.ohTravel.airport.model;

import lombok.Data;

@Data
public class AirplaneDTO {
	private String airplane_name;
	private Integer general_seat;
	private Integer business_seat;
	private Integer first_seat;
}
