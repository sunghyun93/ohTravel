package com.oracle.ohTravel.ticket.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.ohTravel.member.model.MemberDTO;
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
		// member 안 먹히면 sessionId로 수정하기
		boolean loginCheck = session.getAttribute("member") == null;
		
		if(session.getAttribute("member") != null)
			log.info("로그인ID="+((MemberDTO)session.getAttribute("member")).getMem_id());
		
		
		if(!loginCheck) {
			log.info("TicketRestController loginCheck() end");
			return new ResponseEntity<String>("LOGIN_OK", HttpStatus.OK);
		} else {
			log.info("TicketRestController loginCheck() end");
			return new ResponseEntity<String>("LOGIN_NO", HttpStatus.OK);
		}
	}
}
