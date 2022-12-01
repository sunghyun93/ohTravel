package com.oracle.ohTravel.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.ohTravel.member.dao.MemberDao;
import com.oracle.ohTravel.member.domain.Member;
import com.oracle.ohTravel.member.model.MemberDTO;
import com.oracle.ohTravel.member.model.TicketReservationDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;

	// 로그인
	@Override
	public MemberDTO login(MemberDTO memberDTO) {
		log.info("MemberServiceImpl login Start..");
		
		return memberDao.login(memberDTO);
	}

	// 회원가입
	@Override
	public int register(MemberDTO memberDTO) {
		log.info("MemberServiceImpl register Start..");
		int result = memberDao.register(memberDTO);
		
		return result;
	}

	// 티켓 예약 내역
	@Override
	public List<TicketReservationDTO> myPageReservTicket(TicketReservationDTO ticketReservationDTO) {
		log.info("MemberServiceImpl myPageReservTicket Start..");
		List<TicketReservationDTO> ticketReservList = memberDao.myPageReservTicket(ticketReservationDTO);
		return ticketReservList;
	}


	
}
