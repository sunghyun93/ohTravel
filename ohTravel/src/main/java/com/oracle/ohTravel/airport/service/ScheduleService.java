package com.oracle.ohTravel.airport.service;

import java.util.List;
import java.util.Map;

import com.oracle.ohTravel.airport.model.AirSearch;
import com.oracle.ohTravel.airport.model.Air_FlightSchDTO;
import com.oracle.ohTravel.airport.model.Air_ReservationDTO;
import com.oracle.ohTravel.airport.model.Air_Reservation_PiDTO;
import com.oracle.ohTravel.airport.model.Air_ScheduleDTO;
import com.oracle.ohTravel.airport.model.Reservation_Seat;

public interface ScheduleService {

	List<Air_ScheduleDTO> searchAirplane(AirSearch airSeach); //편도 가는 비행기

	List<Air_ScheduleDTO> roundSearchAirplane(AirSearch airSearch); //왕복 오는 비행기

	List<Air_ScheduleDTO> round_GoSearchAriplane(AirSearch airSearch); // 왕복 가는 비행기

	Air_ScheduleDTO airplaneReservationAgreeCheckGo(Integer go_schedule_id); //선택한 가는 비행기 불러오기

	Air_ScheduleDTO airplaneReservationAgreeCheckCome(Integer come_schedule_id); //선택한  오는 비행기 불러오기

//	int insertReservation(Air_ReservationDTO air_ReservationDTO) throws Exception; // 예약 insert
//
//	int insertPiReservation(Air_Reservation_PiDTO air_Reservation_PiDTO) throws Exception;// 인원정보 insert
//
//	int insertFlightSche(Air_FlightSchDTO air_FlightSchDTO) throws Exception;// 비행 일정 insert(왕복인지 아닌지 확인 하기위해)
//
//	int insertSeat(Reservation_Seat reservation_Seat) throws Exception;// 예약된 좌석인지 확인

	int insertAll(Map<String, Object> map) throws Exception;



}
