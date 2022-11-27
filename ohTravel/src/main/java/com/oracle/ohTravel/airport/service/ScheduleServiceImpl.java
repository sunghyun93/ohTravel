package com.oracle.ohTravel.airport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.ohTravel.airport.dao.ScheduleDAO;
import com.oracle.ohTravel.airport.model.AirSearch;
import com.oracle.ohTravel.airport.model.Air_ScheduleDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private ScheduleDAO scheduleDAO;
	
	@Override
	public List<Air_ScheduleDTO> searchAirplane(AirSearch airSeach) {
		List<Air_ScheduleDTO> listAiplane = scheduleDAO.airplaneList(airSeach);
		
		System.out.println("listAiplane="+listAiplane);
		return listAiplane;
	}

}
