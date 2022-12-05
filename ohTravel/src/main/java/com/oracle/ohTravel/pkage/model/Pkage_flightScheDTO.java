package com.oracle.ohTravel.pkage.model;

import java.util.Calendar;
import java.util.Date;

import com.oracle.ohTravel.airport.model.Air_ScheduleDTORM;

import lombok.Data;

@Data
public class Pkage_flightScheDTO {
	private Integer pkage_dt_id;	// 패키지 상세 ID
	private Integer schedule_id;	// 항공 일정 ID
	private Integer	pkage_flight_gubun; 	// 출발도착구분

	// 비행 일정
	Air_ScheduleDTORM air_ScheduleDTORM;
	
	// 더미 변수
	private long flightHour;
	private long flightMinute;
	
	// 비행 시간 구하는 함수 (시, 분)
	public void getTime() {
		Date start = air_ScheduleDTORM.getStart_time();
		Date end = air_ScheduleDTORM.getEnd_time();
		
		long diff = end.getTime() - start.getTime();
		
		// 1000 밀리초 = 1초
		flightHour = diff / (1000 * 60 * 60);
		flightMinute = (diff-(flightHour*(1000 * 60 * 60))) / (1000 * 60);
		
		
	}
}
