package com.oracle.ohTravel.airport.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.ohTravel.airport.dao.ScheduleDAO;
import com.oracle.ohTravel.airport.model.AirSearch;
import com.oracle.ohTravel.airport.model.Air_FlightSchDTO;
import com.oracle.ohTravel.airport.model.Air_ReservationDTO;
import com.oracle.ohTravel.airport.model.Air_Reservation_PiDTO;
import com.oracle.ohTravel.airport.model.Air_ScheduleDTO;
import com.oracle.ohTravel.airport.model.Reservation_Seat;

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

	@Override
	public Air_ScheduleDTO airplaneReservationAgreeCheckGo(Integer go_schedule_id) {
		
		Air_ScheduleDTO goAirplaneList = scheduleDAO.GoairplaneList(go_schedule_id);
		
		
		
		return goAirplaneList;
	}

	@Override
	public Air_ScheduleDTO airplaneReservationAgreeCheckCome(Integer come_schedule_id) {
		
		Air_ScheduleDTO comeAirplaneList = scheduleDAO.ComeairplaneList(come_schedule_id);
		
		return comeAirplaneList;
	}


	@Override
	@Transactional(rollbackFor = Exception.class) //insert시 하나라도 예외 발생시 롤백
	public int insertAll(Map<String, Object> map) throws Exception{
		
		
		int insertCnt = scheduleDAO.ReservationList((Air_ReservationDTO)map.get("air_ReservationDTO"));
			insertCnt = scheduleDAO.pplList((Air_Reservation_PiDTO)map.get("air_Reservation_PiDTO"));
			insertCnt = scheduleDAO.flightList((Air_FlightSchDTO)map.get("air_FlightSchDTO"));
			insertCnt = scheduleDAO.seatList((Reservation_Seat)map.get("reservation_Seat"));
		
		return insertCnt;
	}

	

}
