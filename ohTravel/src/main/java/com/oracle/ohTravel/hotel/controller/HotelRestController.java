package com.oracle.ohTravel.hotel.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.ohTravel.basket.model.BasketDTO;
import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.hotel.model.HotelReservationDTO;
import com.oracle.ohTravel.hotel.model.RoomDTO;
import com.oracle.ohTravel.hotel.service.HotelService;
import com.oracle.ohTravel.member.model.MemberDTO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/hotel")
public class HotelRestController {

	private final HotelService hs;
	
	@GetMapping(value = "/roomList")
	public List<RoomDTO> getRoomList(RoomDTO roomDTO) {
		return hs.getRoomList(roomDTO);
	}
	
	@PostMapping(value = "/reserve")
	public String reserveHotel(HotelReservationDTO hotelRDTO) {
		return hs.reserveHotel(hotelRDTO);
	}
	
	@PostMapping(value = "/heartBasket")
	public String heartBasket(HotelDTO hotelDTO) {
		return hs.heartBasket(hotelDTO);
	}
	
}
