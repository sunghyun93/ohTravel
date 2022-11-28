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
		Air_ScheduleDTO as = new Air_ScheduleDTO();
		System.out.println("as="+as);
		
	
		
		System.out.println("listAirplane="+listAirplane);
		
		return listAirplane;
	}

}
