package com.oracle.ohTravel.ticket.dao;

import java.util.List;

import com.oracle.ohTravel.ticket.model.TicketDTO;

public interface TicketDAO {

	int totalTicket();
	
	// 입장권 상품 목록
	List<TicketDTO> ticketList(TicketDTO ticketdto);
	
	// 입장권 상세 정보
	TicketDTO getTicketDetail(String ticket_id);
	
	
}
