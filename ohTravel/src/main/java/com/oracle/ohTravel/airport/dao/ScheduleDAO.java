package com.oracle.ohTravel.airport.dao;

import java.util.List;

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

	int pplList(Air_Reservation_PiDTO air_Reservation_PiDTO);

	int seatList(Reservation_Seat reservation_Seat);

	int flightList(Air_FlightSchDTO air_FlightSchDTO);


	

	

}
