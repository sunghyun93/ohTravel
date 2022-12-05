package com.oracle.ohTravel.hotel.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.ohTravel.hotel.model.RoomDTO;
import com.oracle.ohTravel.hotel.service.HotelService;

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
}
