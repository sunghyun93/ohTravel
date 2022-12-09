package com.oracle.ohTravel.airport.service;

import java.util.ArrayList;
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
import com.oracle.ohTravel.airport.model.PeopleInfo;
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
		
		goAirplaneList.setLead_time(goAirplaneList.calcLead_time());
		
		return goAirplaneList;
	}

	@Override
	public Air_ScheduleDTO airplaneReservationAgreeCheckCome(Integer come_schedule_id) {
		
		Air_ScheduleDTO comeAirplaneList = scheduleDAO.ComeairplaneList(come_schedule_id);
		
		comeAirplaneList.setLead_time(comeAirplaneList.calcLead_time());
		
		return comeAirplaneList;
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class) //insert시 하나라도 예외 발생시 롤백
	public int insertReservation(Air_ReservationDTO air_ReservationDTO) {
		
		int insertReservationCnt = scheduleDAO.ReservationList(air_ReservationDTO);
		
			return insertReservationCnt;
	}
	
	@Override
	public Air_ReservationDTO selectReservationId(String mem_id) {
		Air_ReservationDTO selectReservationList = scheduleDAO.selectReservationList(mem_id);
		
		return selectReservationList;
	}
	

	@Override
	@Transactional(rollbackFor = Exception.class) //insert시 하나라도 예외 발생시 롤백
	public int insertAll(Map<String, Object> map) throws Exception{
		System.out.println(map.get("reservation_id"));
		int insertCnt = 0;
			PeopleInfo pplInfo= (PeopleInfo)map.get("peopleInfo");
			
		
			//항공 인원 정보 insert
			
			List<Air_Reservation_PiDTO> pplList = new ArrayList<>();
			
			
			for(int i=0; i< pplInfo.getAir_pi_name().size(); i++ ) {
			Air_Reservation_PiDTO air_Reservation_PiDTO = new Air_Reservation_PiDTO(); //한꺼번에 insert 할 list만들기
				air_Reservation_PiDTO.setAir_pi_name(pplInfo.getAir_pi_name().get(i));	//이름
				air_Reservation_PiDTO.setAir_pi_birth(pplInfo.getAir_pi_birth().get(i));	//생년원일
				air_Reservation_PiDTO.setAir_pi_gen(pplInfo.getAir_pi_gen().get(i));	//성별
				air_Reservation_PiDTO.setAir_pi_lname(pplInfo.getAir_pi_lname().get(i));	//영어 성
				air_Reservation_PiDTO.setAir_pi_fname(pplInfo.getAir_pi_fname().get(i));	//영어 이름
				air_Reservation_PiDTO.setAir_pi_tel(pplInfo.getAir_pi_tel().get(i));	//전화번호
				air_Reservation_PiDTO.setAir_pi_email(pplInfo.getAir_pi_email().get(i));	//이메일
				air_Reservation_PiDTO.setAir_passport(pplInfo.getAir_passport().get(i));	//이메일
				
				//list안에 air_Reservation_PiDTO담아주기
				pplList.add(air_Reservation_PiDTO);
				
			}
			map.put("pplList",pplList);
			
			insertCnt = scheduleDAO.pplList(map);
	
			/*
			 * if(map.get("go_airplane_name") != null && map.get("come_airplane_name") ==
			 * null) { //편도 insertCnt = scheduleDAO.goSeatList(map); }else
			 * if(map.get("go_airplane_name") != null && map.get("come_airplane_name") !=
			 * null) //왕복 insertCnt = scheduleDAO.goSeatList(map); insertCnt=
			 * scheduleDAO.comeSeatList(map);
			 */
			
			
				
				
				//일정이 한국에서 가는비행기인지 or 다시 한국으로 오는 비행기인지 구분하려고
				Integer go_schedule_id = (Integer)map.get("go_schedule_id");
				Integer come_schedule_id = (Integer)map.get("come_schedule_id");
				Integer air_gubun =(Integer)map.get("air_gubun"); 
				
			    if( go_schedule_id < 645 ) {
			    	air_gubun = 0;
			    	map.put("air_gubun",air_gubun);
			    }
				
		
				
			if(map.get("go_schedule_id") != null && map.get("come_schedule_id") == null ) { //편도 스케쥴 id
				insertCnt = scheduleDAO.goflightList(map);
			}else if(map.get("go_airplane_name") != null && map.get("come_airplane_name") != null) {//왕복
				insertCnt = scheduleDAO.goflightList(map);
				
				if(come_schedule_id >= 645) {
					air_gubun = 1;
					map.put("air_gubun",air_gubun);
					insertCnt= scheduleDAO.comeflightList(map);
				}
				
			}
				
				
				//결제정보
				insertCnt = scheduleDAO.paymentList(map);
				
				//예약되면 좌석예약수 count+1
				if(map.get("go_schedule_id") != null && map.get("come_schedule_id") == null ) { //편도 스케쥴 id
					insertCnt = scheduleDAO.goflightListCalc(map);
				}else if(map.get("go_airplane_name") != null && map.get("come_airplane_name") != null) {//왕복
					insertCnt = scheduleDAO.goflightListCalc(map);
					insertCnt= scheduleDAO.comeflightListCalc(map);
				}
				
		return insertCnt;
	}

	

	

	

	

}
