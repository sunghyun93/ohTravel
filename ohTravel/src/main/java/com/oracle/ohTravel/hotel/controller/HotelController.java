package com.oracle.ohTravel.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HotelController {

	@GetMapping(value = "hotelmain")
	public String goHotel() {
		return "hotel/hotelMain";
	}
	
	@GetMapping(value = "hotelHome")
	public String goHotelHome() {
		return "hotel/hotelHome";
	}
	
	@GetMapping(value = "hotelDetail")
	public String goHotelDetail() {
		return "hotel/hotelDetail";
	}
}
