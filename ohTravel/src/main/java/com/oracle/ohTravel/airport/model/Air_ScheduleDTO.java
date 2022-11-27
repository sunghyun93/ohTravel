package com.oracle.ohTravel.airport.model;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class Air_ScheduleDTO {
	//일정(auto_increment)
	private int schedule_id;
	//항공사 정보
	private int air_num;
	private int air_code;
	private String air_name;
	private String air_pricture;
	//항공편명
	private String airplane_name;
	private int general_seat;
	private int business_seat;
	private int first_seat;
	
	//출발공항명
	private String start_airport_name;
	private int country_id;
	private int country_name;
	private int city_id;
	private int city_name;
	
	//도착공항명
	private String end_airport_name;
	
	//출발시간
	private Date start_time;
	//도착시간
	private Date end_time;
	//가격
	private int schedule_price;
	
	//좌석
	private String seat_position;
	private int seat_grade;
	private String seat_name;
	private int plus_seat_price;
	
	//예약좌석
	private int reservation_id;
	private int seated_status;
	
	
	
}
