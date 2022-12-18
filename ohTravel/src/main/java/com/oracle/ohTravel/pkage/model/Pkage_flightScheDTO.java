package com.oracle.ohTravel.pkage.model;

import java.util.Date;
import java.util.List;

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
	
	// insert 시 데이터 받는 변수
	private List<Integer> pkage_dt_idL;
	private Integer startSchedule_id;	// 시작 일정 ID
	private Integer endSchedule_id;		// 종료 일정 ID
	private List<Integer> pkage_gubunL;
	private String updateStartDate;		// 업데이트할 시작 시간
	private String updateEndDate;		// 업데이트할 종료 시간
	
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
