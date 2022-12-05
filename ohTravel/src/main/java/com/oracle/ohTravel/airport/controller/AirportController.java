package com.oracle.ohTravel.airport.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.ohTravel.airport.model.AirSearch;
import com.oracle.ohTravel.airport.model.Air_FlightSchDTO;
import com.oracle.ohTravel.airport.model.Air_ReservationDTO;
import com.oracle.ohTravel.airport.model.Air_Reservation_PiDTO;
import com.oracle.ohTravel.airport.model.Air_ScheduleDTO;
import com.oracle.ohTravel.airport.model.Reservation_Seat;
import com.oracle.ohTravel.airport.service.ScheduleService;
import com.oracle.ohTravel.city.model.CityDTO;
import com.oracle.ohTravel.city.service.CityService;
import com.oracle.ohTravel.country.model.CountryDTO;
import com.oracle.ohTravel.country.service.CountryService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/airport")
@Slf4j
public class AirportController {
	
	private final CityService cityService;
	private final CountryService countryService;
	private final ScheduleService scheduleService;
	
	//항공권 검색
	@RequestMapping(value = "/searchTicket")
	public String searchTicket(Model model) throws Exception {
		log.info("AirportController searchTicket");
		// 가고싶은 나라 country 모두 가져오기
		List<CountryDTO> countryList = countryService.selectCountryByCountryId(0);
				
		
		model.addAttribute("countryList",countryList);
		
		return "airport/searchTicket";
	}
	
	//항공권 예약
	@RequestMapping(value = "/air_reservation")
	public String air_reservation() {
		return "airport/air_reservation";
	}
	
	//도시불러오는 메서드
	@PostMapping("/selectCity")
	@ResponseBody
	public List<CityDTO> selectCity(Integer country_id) throws Exception {
		log.info("AirportController selectCity() start...");
		List<CityDTO> list = cityService.selectCityByCountryId(country_id);
		log.info("AirportController selectCity() end...");
		return list;
	}
	
	@GetMapping("/searchAirplane")
	public ModelAndView searchAirplane(AirSearch airSearch) {
		
		ModelAndView mav = new ModelAndView();
		List<Air_ScheduleDTO> oneway_schedule_list= null;
		List<Air_ScheduleDTO> round_trip_come_schedule_list=null;
		List<Air_ScheduleDTO> round_trip_go_schedule_list=null;
	
		
		if(airSearch.getGubun_check()==1) { //편도일때(가는비행기)
				oneway_schedule_list = scheduleService.searchAirplane(airSearch);
				mav.addObject("schedule_list",oneway_schedule_list);//편도일때 가는비행기 select
		}else if(airSearch.getGubun_check()==0) { //왕복일때(오는비행기)
			
			 round_trip_come_schedule_list = scheduleService.roundSearchAirplane(airSearch);
			 round_trip_go_schedule_list = scheduleService.round_GoSearchAriplane(airSearch);
			 mav.addObject("comeList",round_trip_come_schedule_list); // 왕복일때 오는 비행기 select
			 mav.addObject("goList",round_trip_go_schedule_list); // 왕복일때 가는 비행기
		}
			
	
		
		System.out.println("oneway_schedule_list="+oneway_schedule_list);
		System.out.println("round_trip_come_schedule_list="+round_trip_come_schedule_list);
		System.out.println("airSearch="+airSearch);
		
		
		
		
		mav.setViewName("airport/resultAirplane");
		
		mav.addObject("seat_position",airSearch.getSeat_position());
		mav.addObject("start_date1",airSearch.getStart_date1());
		mav.addObject("start_date2",airSearch.getStart_date2());
		mav.addObject("end_date",airSearch.getEnd_date());
		mav.addObject("start_city_id",airSearch.getStart_city_id());
		mav.addObject("end_city_id",airSearch.getEnd_city_id());
		mav.addObject("gubun_check",airSearch.getGubun_check());
		mav.addObject("order",airSearch.getOrder());
		mav.addObject("count",airSearch.getCount());
		mav.addObject("seat_name",airSearch.getSeat_name());
		mav.addObject("start_country_id",airSearch.getStart_country_id());
		mav.addObject("end_country_id",airSearch.getEnd_country_id());


		return mav;
	}
	
	@GetMapping("/searchAirplaneAjax")
	public ModelAndView searchAirplaneAjax(int order,AirSearch airSearch) {
		
		System.out.println("searchAirplaneAjax airSearch="+airSearch);
		System.out.println("searchAirplaneAjax order="+order);
		airSearch.setOrder(order);
		
		ModelAndView mav = new ModelAndView();
		List<Air_ScheduleDTO> oneway_schedule_list= null;
		List<Air_ScheduleDTO> round_trip_come_schedule_list=null;
		List<Air_ScheduleDTO> round_trip_go_schedule_list=null;
	
		
		if(airSearch.getGubun_check()==1) { //편도일때(가는비행기)
				oneway_schedule_list = scheduleService.searchAirplane(airSearch);
				mav.addObject("schedule_list",oneway_schedule_list);//편도일때 가는비행기 select
		}else if(airSearch.getGubun_check()==0) { //왕복일때(오는비행기)
			
			 round_trip_come_schedule_list = scheduleService.roundSearchAirplane(airSearch);
			 round_trip_go_schedule_list = scheduleService.round_GoSearchAriplane(airSearch);
			 mav.addObject("comeList",round_trip_come_schedule_list); // 왕복일때 오는 비행기 select
			 mav.addObject("goList",round_trip_go_schedule_list); // 왕복일때 가는 비행기
		}
			
	
		
		System.out.println("oneway_schedule_list="+oneway_schedule_list);
		System.out.println("round_trip_come_schedule_list="+round_trip_come_schedule_list);
		System.out.println("airSearch="+airSearch);
		
		mav.setViewName("ajaxSearch/resultAirplaneAjax");
		mav.addObject("gubun_check",airSearch.getGubun_check());
		mav.addObject("start_date1",airSearch.getStart_date1());
		mav.addObject("start_date2",airSearch.getStart_date2());
		mav.addObject("start_city_id",airSearch.getStart_city_id());
		mav.addObject("end_city_id",airSearch.getEnd_city_id());
		return mav;
	}
	
	@PostMapping("/reservationAirplaneAgreeCheck")
	public ModelAndView airplaneReservationAgreeCheck(Integer count,Integer go_schedule_id,Integer come_schedule_id,String seat_position,String seat_name,Integer gubun_check,Integer start_city_id,Integer end_city_id) {
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("airplaneReservation count="+count);
		System.out.println("airplaneReservation go_schedule_id="+go_schedule_id);
		System.out.println("airplaneReservation come_schedule_id="+come_schedule_id);
		System.out.println("airplaneReservation seat_position="+seat_position);
		System.out.println("airplaneReservation seat_name="+seat_name);
		System.out.println("gubun_check="+gubun_check);
		
		//왕복 가는비행기와 오는비행기
		if(gubun_check == 0) {
			Air_ScheduleDTO  scheduleGo= scheduleService.airplaneReservationAgreeCheckGo(go_schedule_id);
			Air_ScheduleDTO scheduleCome = scheduleService.airplaneReservationAgreeCheckCome(come_schedule_id);
			mav.addObject("go",scheduleGo);
			mav.addObject("come",scheduleCome);
		//편도 가는비행기	
		}else if(gubun_check == 1) {
			Air_ScheduleDTO  scheduleGo= scheduleService.airplaneReservationAgreeCheckGo(go_schedule_id);
			mav.addObject("go",scheduleGo);
		}
		
		
		
		
		
		mav.setViewName("airport/air_reservation");
		mav.addObject("count",count);
		mav.addObject("go_schedule_id",go_schedule_id);
		mav.addObject("come_schedule_id",come_schedule_id);
		mav.addObject("seat_position",seat_position);
		mav.addObject("seat_name",seat_name);
		mav.addObject("start_city_id",start_city_id);
		mav.addObject("end_city_id",end_city_id);
		
		
		return mav;
		
	}
	
	
	@PostMapping("/airplaneReserve")
	public String airReserve(int go_schedule_id,int come_schedule_id, int count,String total_price, String seat_position,String seat_name,Model model) {
		
		model.addAttribute("count", count);
		model.addAttribute("price", total_price);
		model.addAttribute("go_schedule_id", go_schedule_id);
		model.addAttribute("come_schedule_id", come_schedule_id);
		model.addAttribute("seat_position", seat_position);
		model.addAttribute("seat_name", seat_name);
		
		System.out.println("price="+total_price);
		
		
		return "airport/airplane_reservation";
	}
	
	@PostMapping("/airplaneInsertReservation")
	public ModelAndView airInsertReserva(String seat_position,int go_schedule_id,int come_schedule_id,Air_ReservationDTO air_ReservationDTO,Air_Reservation_PiDTO air_Reservation_PiDTO,Air_FlightSchDTO air_FlightSchDTO,Reservation_Seat reservation_Seat) throws Exception {
	
		ModelAndView mav = new ModelAndView();
		
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("air_ReservationDTO",air_ReservationDTO);
		map.put("air_Reservation_PiDTO",air_Reservation_PiDTO);
		map.put("air_FlightSchDTO",air_FlightSchDTO);
		map.put("reservation_Seat",reservation_Seat);
		
		System.out.println("map="+map);
		
		
		 int insertMethod = scheduleService.insertAll(map);
		
//		 int reservationCnt = scheduleService.insertReservation(air_ReservationDTO);
//		 int piCnt = scheduleService.insertPiReservation(air_Reservation_PiDTO);
//		 int flightCnt = scheduleService.insertFlightSche(air_FlightSchDTO);
//		 int seatCnt = scheduleService.insertSeat(reservation_Seat);
		
		
			
		mav.setViewName("airport/resultReservation");
		mav.addObject("seat_position", seat_position);
		mav.addObject("go_schedule_id", go_schedule_id);
		mav.addObject("come_schedule_id", come_schedule_id);
//		mav.addObject("reservationCnt",reservationCnt);
//		mav.addObject("piCnt",piCnt);
//		mav.addObject("flightCnt",flightCnt);
//		mav.addObject("seatCnt",seatCnt);
		mav.addObject("insertMethod",insertMethod);
		
		
		return mav;
	}
	
}
