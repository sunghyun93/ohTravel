package com.oracle.ohTravel.ticket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.ticket.model.TicketDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class TicketDAOImpl implements TicketDAO {
	
	/* MyBatis DB 연동 */
	private final SqlSession session;

	
	@Override
	public int totalTicket() {
		int totTicketCnt = 0;
		System.out.println("~~ TicketDAOImpl Start total ~~");
		
		try {
			totTicketCnt = session.selectOne("ticketTotal");
			System.out.println("TicketDAOImpl totalTicket totTicketCnt -> " + totTicketCnt);
		} catch (Exception e) {
			System.out.println("TicketDAOImpl totalTicket Exception -> " + e.getMessage());
		}
		
		return totTicketCnt;
	}
	
	// [입장권 메인] 입장권 목록
	@Override
	public List<TicketDTO> ticketList(TicketDTO ticketDTO) {
		List<TicketDTO> ticketList = session.selectList("ticketList", ticketDTO);
		return ticketList;
	}

	// 입장권 상세 정보
	@Override
	public TicketDTO getTicketDetail(TicketDTO ticketDTO) {
		return session.selectOne("ticketDetail", ticketDTO);
	}


	
	
	
}
