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
		
		List<Air_ScheduleDTO> listAirplane = scheduleDAO.airplaneList(airSeach);
		for(Air_ScheduleDTO arr:listAirplane) {
			arr.setLead_time(arr.calcLead_time());
		}
		
	
		
		System.out.println("listAirplane="+listAirplane);
		
		return listAirplane;
	}

	@Override
	public List<Air_ScheduleDTO> roundSearchAirplane(AirSearch airSearch) {
		
		List<Air_ScheduleDTO> round_listAirplane = scheduleDAO.round_airplaneList(airSearch);
		
		for(Air_ScheduleDTO arr:round_listAirplane) {
			arr.setLead_time(arr.calcLead_time());
		}
		
		
		return round_listAirplane;
	}

	@Override
	public List<Air_ScheduleDTO> round_GoSearchAriplane(AirSearch airSearch) {
		
		List<Air_ScheduleDTO> round_golistAirplane = scheduleDAO.round_GoairplaneList(airSearch);
		
		for(Air_ScheduleDTO arr:round_golistAirplane) {
			arr.setLead_time(arr.calcLead_time());
		}
		
		return round_golistAirplane;
	}

}
