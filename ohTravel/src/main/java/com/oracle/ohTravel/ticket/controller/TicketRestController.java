package com.oracle.ohTravel.ticket.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.ohTravel.ticket.service.TicketService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/ticketRest")
@Slf4j
public class TicketRestController {
	@Autowired
	private TicketService ts;
	
	
	// 로그인 체크용
	@GetMapping("/loginCheck")
	public ResponseEntity<String> loginCheck(HttpSession session) {
		log.info("== TicketRestController loginCheck() Start ==");
	
		boolean loginCheck = session.getAttribute("sessionId") == null;
		
		if(!loginCheck) {
			log.info("TicketRestController loginCheck() end");
			return new ResponseEntity<String>("LOGIN_OK", HttpStatus.OK);
		} else {
			log.info("TicketRestController loginCheck() end");
			return new ResponseEntity<String>("LOGIN_NO", HttpStatus.OK);
		}
	}
}
