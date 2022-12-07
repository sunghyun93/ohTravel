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

	int insertAll(Map<String, Object> map) throws Exception;

	int insertReservation(Air_ReservationDTO air_ReservationDTO);

	Air_ReservationDTO selectReservationId(String mem_id); //reservation_id 가져오기위해서



}
