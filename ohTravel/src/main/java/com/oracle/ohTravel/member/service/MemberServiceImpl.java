package com.oracle.ohTravel.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.ohTravel.member.dao.MemberDao;
import com.oracle.ohTravel.member.domain.Member;
import com.oracle.ohTravel.member.model.AirReservationDTO;
import com.oracle.ohTravel.member.model.HotelReservationDTO;
import com.oracle.ohTravel.member.model.MemberDTO;
import com.oracle.ohTravel.member.model.PackageReservationDTO;
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
	
	
	// 호텔 예약 내역 조회
	@Override
	public List<HotelReservationDTO> myPageReservHotel(HotelReservationDTO hotelReservationDTO) {
		log.info("MemberServiceImpl myPageReservHotel Start..");
		List<HotelReservationDTO> hotelReservList = memberDao.myPageReservHotel(hotelReservationDTO);
		return hotelReservList;
	}

	// 항공 예약 내역 조회
	@Override
	public List<AirReservationDTO> myPageReservAir(AirReservationDTO airReservationDTO) {
		log.info("MemberServiceImpl MemberServiceImpl Start..");
		List<AirReservationDTO> airReservList = memberDao.myPageReservAir(airReservationDTO);
		return airReservList;
	}
	
	// 티켓 예약 내역 조회
	@Override
	public List<TicketReservationDTO> myPageReservTicket(TicketReservationDTO ticketReservationDTO) {
		log.info("MemberServiceImpl myPageReservTicket Start..");
		List<TicketReservationDTO> ticketReservList = memberDao.myPageReservTicket(ticketReservationDTO);
		return ticketReservList;
	}
	
	// 패키지 예약 내역 조회
	@Override
	public List<PackageReservationDTO> myPageReservPackage(PackageReservationDTO packageReservationDTO) {
		log.info("MemberServiceImpl myPageReservPackage Start..");
		List<PackageReservationDTO> packageReservList = memberDao.myPageReservPackage(packageReservationDTO);
		return packageReservList;
	}

	// 회원 탈퇴
	@Override
	public int deleteMember(MemberDTO memberDTO) {
		log.info("MemberServiceImpl deleteMember Start..");
		int result = memberDao.deleteMember(memberDTO);
		System.out.println("MemberServiceImpl deleteMember result -> " + result);
		return result;
	}

	

	

	
}
