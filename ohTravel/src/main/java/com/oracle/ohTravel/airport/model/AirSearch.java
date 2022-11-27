package com.oracle.ohTravel.airport.model;

import java.sql.Date;
import lombok.Data;

@Data
public class AirSearch {
	private int start_country_id;
	private int end_country_id;
	private Date start_time;
	private Date end_time;
	private int count;
	private String seat_position;
}
