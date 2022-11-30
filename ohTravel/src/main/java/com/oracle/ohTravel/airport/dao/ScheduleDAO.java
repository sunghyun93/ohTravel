package com.oracle.ohTravel.airport.dao;

import java.util.List;

import com.oracle.ohTravel.airport.model.AirSearch;
import com.oracle.ohTravel.airport.model.Air_ScheduleDTO;

public interface ScheduleDAO {

	List<Air_ScheduleDTO> airplaneList(AirSearch airSeach);

	List<Air_ScheduleDTO> round_airplaneList(AirSearch airSearch);

	List<Air_ScheduleDTO> round_GoairplaneList(AirSearch airSearch);

}
