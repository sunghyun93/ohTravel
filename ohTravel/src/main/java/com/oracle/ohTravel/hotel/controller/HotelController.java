package com.oracle.ohTravel.hotel.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.hotel.service.HotelService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/hotel")
@RequiredArgsConstructor
public class HotelController {

	
	private final HotelService hs;
	
	
	@GetMapping(value = "/hotelmain")
	public String goHotel() {
		return "hotel/hotelMain";
	}
	
	
	//호텔 카테고리 처음 눌렀을 때, db의 모든 호텔 정보가 있어야 추천/테마 등에 맞게 정렬됨
	@GetMapping(value = "/hotelHome")
	public String goHotelHome(HotelDTO hoteldto, Model model) {
		
		List<HotelDTO> hotelList = hs.hotelList(hoteldto);
		model.addAttribute("hotelList", hotelList);
		
		return "hotel/hotelHome";
	}
	
	//호텔 목록에서 호텔 하나를 선택했을때 나올 페이지
	@GetMapping(value = "/hotelDetail")
	public String goHotelDetail() {
		return "hotel/hotelDetail";
	}
}
