package com.oracle.ohTravel.airport.model;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class Air_ScheduleDTO {
	
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
	private int start_country_id;
	private int start_country_name;
	private int start_city_id;
	private int start_city_name;
	
	//도착공항명
	private String end_airport_name;
	private int end_country_id;
	private int end_country_name;
	private int end_city_id;
	private int end_city_name;
	
	//출발시간
	private Timestamp start_time;
	//도착시간
	private Timestamp end_time;
	//소요시간
	private String lead_time;
	//가격
	private int schedule_price;
	
	//일반석 예약수
	private int general_res_count;
	//비즈니스석 예약수
	private int business_res_count;
	//일등석 예약수
	private int first_res_count;
	
	//일반석 잔여좌석 수
	private int general_remaining_seats;
	//비즈니스석 잔여좌석 수
	private int business_remaining_seats;
	//일등석 잔여좌석 수
	private int first_remaining_seats;
	
	//좌석
	private String seat_position;
	private int count;
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
	
	//일반석 잔여좌석수 계산
	public int generalCalc() {
		general_remaining_seats = general_seat - general_res_count;
		
		return general_remaining_seats;
	}
	//비즈니스석 잔여좌석수 계산
		public int businessCalc() {
			business_remaining_seats = business_seat - business_res_count;
			
			return business_remaining_seats;
		}
	//일등석 잔여좌석수 계산
	public int firstCalc() {
		first_remaining_seats = first_seat - first_res_count;
		
		return first_remaining_seats;
	}	
	
}
