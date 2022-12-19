package com.oracle.ohTravel.airport.service;

import java.util.List;
import java.util.Map;

import com.oracle.ohTravel.airport.model.AirSearch;
import com.oracle.ohTravel.airport.model.Air_FlightSchDTO;
import com.oracle.ohTravel.airport.model.Air_ReservationDTO;
import com.oracle.ohTravel.airport.model.Air_Reservation_PiDTO;
import com.oracle.ohTravel.airport.model.Air_ScheduleDTO;
import com.oracle.ohTravel.airport.model.Reservation_Seat;
import com.oracle.ohTravel.member.model.AirReservationDetail;

public interface ScheduleService {

	List<Air_ScheduleDTO> searchAirplane(AirSearch airSeach); //편도 가는 비행기

	List<Air_ScheduleDTO> roundSearchAirplane(AirSearch airSearch); //왕복 오는 비행기

	List<Air_ScheduleDTO> round_GoSearchAriplane(AirSearch airSearch); // 왕복 가는 비행기

	Air_ScheduleDTO airplaneReservationAgreeCheckGo(Integer go_schedule_id); //선택한 가는 비행기 불러오기

	Air_ScheduleDTO airplaneReservationAgreeCheckCome(Integer come_schedule_id); //선택한  오는 비행기 불러오기

	int insertAll(Map<String, Object> map) throws Exception;

	int insertReservation(Air_ReservationDTO air_ReservationDTO);

	Air_ReservationDTO selectReservationId(String mem_id); //reservation_id 가져오기위해서

	Air_ReservationDTO selectCompleteReservationId(Integer reservation_id); //결제 완료하고 reservation_id와 reservation_date 가져오기위해서

	List<Air_Reservation_PiDTO> selectReservation(Integer reservation_id); //회원정보 가져올려고

	List<Air_Reservation_PiDTO> updatePeopleInfo(Air_Reservation_PiDTO air_Reservation_PiDTO); //회원정보 진짜 수정

	



}
