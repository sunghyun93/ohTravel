package com.oracle.ohTravel.member.dao;

import java.util.List;

import com.oracle.ohTravel.member.model.MemberDTO;
import com.oracle.ohTravel.member.model.TicketReservationDTO;

public interface MemberDao {

	// 로그인
	public MemberDTO login(MemberDTO memberDTO);
	
	// 회원가입
	public int register(MemberDTO memberDTO);

	// 티켓 예약 내역
	public List<TicketReservationDTO> myPageReservTicket(TicketReservationDTO ticketReservationDTO);
}
