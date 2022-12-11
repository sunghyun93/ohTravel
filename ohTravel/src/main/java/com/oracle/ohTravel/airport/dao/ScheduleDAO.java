package com.oracle.ohTravel.airport.dao;

import java.util.List;
import java.util.Map;

import com.oracle.ohTravel.airport.model.AirSearch;
import com.oracle.ohTravel.airport.model.Air_FlightSchDTO;
import com.oracle.ohTravel.airport.model.Air_ReservationDTO;
import com.oracle.ohTravel.airport.model.Air_Reservation_PiDTO;
import com.oracle.ohTravel.airport.model.Air_ScheduleDTO;
import com.oracle.ohTravel.airport.model.Reservation_Seat;

public interface ScheduleDAO {

	List<Air_ScheduleDTO> airplaneList(AirSearch airSeach);

	List<Air_ScheduleDTO> round_airplaneList(AirSearch airSearch);

	List<Air_ScheduleDTO> round_GoairplaneList(AirSearch airSearch);

	Air_ScheduleDTO GoairplaneList(Integer go_schedule_id);

	Air_ScheduleDTO ComeairplaneList(Integer come_schedule_id);

	int ReservationList(Air_ReservationDTO air_ReservationDTO);
	
	Air_ReservationDTO selectReservationList(String mem_id);

	int pplList(Map<String,Object> map)throws Exception;

	int goSeatList(Map<String,Object> map)throws Exception;
	
	int comeSeatList(Map<String,Object> map) throws Exception;

	int goflightList(Map<String,Object> map) throws Exception;
	
	int comeflightList(Map<String,Object> map) throws Exception;

	int paymentList(Map<String, Object> map) throws Exception;

	int goflightListCalc(Map<String, Object> map) throws Exception;

	int comeflightListCalc(Map<String, Object> map) throws Exception;

	Air_ReservationDTO selectReservationDetail(Integer reservation_id); //예약 정보를 얻어오기위해서


	

	


	

	

}
