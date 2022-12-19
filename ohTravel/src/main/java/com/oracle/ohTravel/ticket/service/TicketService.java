package com.oracle.ohTravel.ticket.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.oracle.ohTravel.ticket.model.TicketDTO;
import com.oracle.ohTravel.ticket.model.TicketReservation;

@Service
public interface TicketService {
	
	int totalTicket();

	// 입장권 목록
	List<TicketDTO> ticketList(TicketDTO ticketdto);
	
	// 입장권 상세 정보
	TicketDTO getTicketDetail(String ticket_id);

	// 입장권 찐예약
	void reserveExhibition(TicketReservation trDTO);

	TicketReservation selectCompleteReservationId(Integer ticket_order_id);

	// 찜
	String ticketBasket(TicketDTO ticketDTO);


	
}
