package com.oracle.ohTravel.ticket.service;

import java.util.List;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.ohTravel.ticket.model.TicketDTO;
import com.oracle.ohTravel.ticket.model.TicketReservation;

import lombok.RequiredArgsConstructor;

@Service
public interface TicketService {
	
	int totalTicket();

	// 입장권 목록
	List<TicketDTO> ticketList(TicketDTO ticketdto);
	
	// 입장권 상세 정보
	TicketDTO getTicketDetail(String ticket_id);

	// 입장권 찐예약
	void reserveExhibition(TicketReservation trDTO);

	
}
