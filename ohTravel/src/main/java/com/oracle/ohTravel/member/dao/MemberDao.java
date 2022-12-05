package com.oracle.ohTravel.member.dao;

import java.util.List;

import com.oracle.ohTravel.member.model.AirReservationDTO;
import com.oracle.ohTravel.member.model.HotelReservationDTO;
import com.oracle.ohTravel.member.model.MemberDTO;
import com.oracle.ohTravel.member.model.PackageReservationDTO;
import com.oracle.ohTravel.member.model.TicketReservationDTO;

public interface MemberDao {

	// 로그인
	public MemberDTO login(MemberDTO memberDTO);
	
	// 회원가입
	public int register(MemberDTO memberDTO);

	// 티켓 예약 내역
	public List<TicketReservationDTO> myPageReservTicket(TicketReservationDTO ticketReservationDTO);

	// 항공 예약 내역
	public List<AirReservationDTO> myPageReservAir(AirReservationDTO airReservationDTO);

	// 호텔 예약 내역
	public List<HotelReservationDTO> myPageReservHotel(HotelReservationDTO hotelReservationDTO);

	// 패키지 예약 내역
	public List<PackageReservationDTO> myPageReservPackage(PackageReservationDTO packageReservationDTO);

	// 회원 탈퇴
	public int deleteMember(MemberDTO memberDTO);

	// 개인 정보 수정
	public int updateMember(MemberDTO memberDTO);
}

