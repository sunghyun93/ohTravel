package com.oracle.ohTravel.member.model;

import java.util.Date;
import java.util.List;

import com.oracle.ohTravel.airport.model.Air_FlightSchDTO;
import com.oracle.ohTravel.airport.model.Air_Reservation_PiDTO;
import com.oracle.ohTravel.airport.model.SeatDTO;

import lombok.Data;

//resultMap을 위한 DTO
@Data
public class AirReservationDetail {
	
	private Date reservation_date;
	private Integer reservation_id;
	private String mem_id;
	private String seat_position;
	private Integer reservation_price;
	
	private Integer air_pi_id;
	
	// 항공 비행스케쥴(출발인지 도착인지 알수있는 테이블)
	private List<Air_FlightSchDTO> air_flightSchDTO;
	
	private List<Air_Reservation_PiDTO> air_Reservation_PiDTO;
	
	private SeatDTO seatDTO;
	
	//페이징처리를 위한
	private String pageNum;  
	private Integer start;
	private Integer end;
}
