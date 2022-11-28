package com.oracle.ohTravel.airport.service;

import java.util.List;

import com.oracle.ohTravel.airport.model.AirSearch;
import com.oracle.ohTravel.airport.model.Air_ScheduleDTO;

public interface ScheduleService {

	List<Air_ScheduleDTO> searchAirplane(AirSearch airSeach);

}
