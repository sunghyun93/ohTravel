package com.oracle.ohTravel.ticket.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.ohTravel.ticket.dao.TicketDAO;
import com.oracle.ohTravel.ticket.model.TicketDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TicketServiceImpl implements TicketService {

	private final TicketDAO td;
	
	// 입장권 목록
	@Override
	public List<TicketDTO> ticketList(TicketDTO ticketdto) {
		System.out.println("~~ TicketServiceImpl ticketList Start ~~");
		return td.ticketList(ticketdto);
	}

	// 입장권 상세 정보
	@Override
	public TicketDTO getTicketDetail(TicketDTO ticketDTO) {
		System.out.println("~~ TicketServiceImpl getTicketDetail Start ~~");
		return td.getTicketDetail(ticketDTO);
	}

}
