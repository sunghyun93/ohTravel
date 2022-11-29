package com.oracle.ohTravel.airport.service;

import java.util.List;

import com.oracle.ohTravel.airport.model.AirSearch;
import com.oracle.ohTravel.airport.model.Air_ScheduleDTO;

public interface ScheduleService {

	List<Air_ScheduleDTO> searchAirplane(AirSearch airSeach); //편도

	List<Air_ScheduleDTO> roundSearchAirplane(AirSearch airSearch); //왕복

	List<Air_ScheduleDTO> round_GoSearchAriplane(AirSearch airSearch);

}
