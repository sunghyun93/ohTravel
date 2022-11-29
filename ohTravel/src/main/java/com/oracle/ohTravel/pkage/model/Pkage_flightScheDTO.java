package com.oracle.ohTravel.pkage.model;

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
}
