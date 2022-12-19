package com.oracle.ohTravel.ticket.dao;

import java.util.List;
import java.util.Map;

import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.ticket.model.TicketDTO;
import com.oracle.ohTravel.ticket.model.TicketReservation;

public interface TicketDAO {

	int totalTicket();
	
	// 입장권 상품 목록
	List<TicketDTO> ticketList(TicketDTO ticketdto);
	
	// 입장권 상세 정보
	TicketDTO getTicketDetail(TicketDTO ticketDTO);

	// 입장권 예약
	void reserveExhibition(TicketReservation trDTO);

	TicketReservation selectReservationDetail(Integer ticket_order_id);

	// payment 테이블에 결제 내역 저장
	void insertPayment(TicketReservation trDTO);

	// 찜  관련
	TicketDTO selectBasket(TicketDTO ticketDTO);
	
	void insertBasket(TicketDTO ticketDTO);			// 찜
	void deleteBasket(TicketDTO ticketDTO);			// 찜 해제
	
}
