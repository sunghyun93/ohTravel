package com.oracle.ohTravel.airport.model;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class Air_ScheduleDTO {
	
	/*
	 * public Air_ScheduleDTO() { lead_time=calcLead_time(); }
	 */
	//일정(auto_increment)
	private int schedule_id;
	//항공사 정보
	private int air_num;
	private int air_code;
	private String air_name;
	private String air_picture;
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
	private Timestamp start_time;
	//도착시간
	private Timestamp end_time;
	//소요시간
	private String lead_time;
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
	
	public String calcLead_time() {
		lead_time = (end_time.getTime()-start_time.getTime())/(1000*60)+"";
		
		return lead_time;
	}
	
	
}
