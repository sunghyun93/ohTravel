package com.oracle.ohTravel.ticket.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.airport.model.Air_ReservationDTO;
import com.oracle.ohTravel.ticket.model.TicketDTO;
import com.oracle.ohTravel.ticket.model.TicketReservation;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
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
	public TicketDTO getTicketDetail(String ticket_id) {
		System.out.println("~~ TicketDAOImpl getTicketDetail ~~");
		
		TicketDTO ticketDTO = new TicketDTO();
		
		try {
			ticketDTO = session.selectOne("ticketDetail", ticket_id);	// xml로 값 가져가기
		} catch (Exception e) {
			System.out.println("TicketDAOImpl getTicketDetail Exception -> " + e.getMessage());
		}
		
		return ticketDTO;
	}

	// 입장권 찐예약
	@Override
	public void reserveExhibition(TicketReservation trDTO) {
		System.out.println("~~ TicketDAOImpl reserveTicket ~~");
		
		try {
			session.insert("realReserve", trDTO);
			session.commit();
		} catch (Exception e) {
			System.out.println("TicketDAOImpl reserve Exception" + e.getMessage());
		}
	}

	@Override
	public TicketReservation selectReservationDetail(Integer ticket_order_id) {
		System.out.println("~~ TicketDAOImpl selectReservationDetail ~~");
		
		Air_ReservationDTO air_ReservationDTO = session.selectOne("reservationDetails", ticket_order_id);
		System.out.println("ScheduleDAOImpl selectReservationDetail air_ReservationDTO" + air_ReservationDTO);
		
		
		TicketReservation trDTO = session.selectOne("reservationDetails", ticket_order_id);
		System.out.println("TicketDAOImpl selectReservationDetail trDTO" + trDTO);
		
		return trDTO;
	}

	// payment 테이블 insert
	@Override
	public void insertPayment(TicketReservation trDTO) {
		session.insert("insertTicketPayment", trDTO);
	}

	
	@Override
	public TicketDTO selectBasket(TicketDTO ticketDTO) {
		return session.selectOne("selectTicketBasket", ticketDTO);
	}
	
	// 찜 등록
	@Override
	public void insertBasket(TicketDTO ticketDTO) {
		session.insert("insertTicketBasket", ticketDTO);
	}

	// 찜 해제
	@Override
	public void deleteBasket(TicketDTO ticketDTO) {
		session.delete("deleteTicketBasket", ticketDTO);
	}

}
