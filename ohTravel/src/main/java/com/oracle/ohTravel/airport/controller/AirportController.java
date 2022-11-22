package com.oracle.ohTravel.airport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AirportController {

	@RequestMapping(value = "/airport/searchTicket")
	public String searchTicket() {
		return "airport/searchTicket";
	}
	
	@RequestMapping(value = "/airport/air_reservation")
	public String air_reservation() {
		return "airport/air_reservation";
	}
}
