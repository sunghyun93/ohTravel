package com.oracle.ohTravel.ticket.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.ohTravel.ticket.model.TicketDTO;

@Service
public interface TicketService {
	
	int totalTicket();

	// 입장권 목록
	List<TicketDTO> ticketList(TicketDTO ticketdto);
	
	// 입장권 상세 정보
	TicketDTO getTicketDetail(String ticket_id);

	
}
