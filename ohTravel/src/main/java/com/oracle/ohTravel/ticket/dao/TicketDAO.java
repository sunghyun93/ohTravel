package com.oracle.ohTravel.ticket.dao;

import java.util.List;

import com.oracle.ohTravel.ticket.model.TicketDTO;
import com.oracle.ohTravel.ticket.model.TicketReservation;

public interface TicketDAO {

	int totalTicket();
	
	// 입장권 상품 목록
	List<TicketDTO> ticketList(TicketDTO ticketdto);
	
	// 입장권 상세 정보
	TicketDTO getTicketDetail(String ticket_id);

	// 입장권 예약
	void reserveExhibition(TicketReservation trDTO);

	TicketReservation selectReservationDetail(Integer ticket_order_id);
	
}
