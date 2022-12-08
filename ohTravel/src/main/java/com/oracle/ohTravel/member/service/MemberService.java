package com.oracle.ohTravel.member.service;

import java.util.List;

import com.oracle.ohTravel.manager.model.CouponDTO;
import com.oracle.ohTravel.member.model.AirReservationDTO;
import com.oracle.ohTravel.member.model.HotelReservationDTO;
import com.oracle.ohTravel.member.model.MemberDTO;
import com.oracle.ohTravel.member.model.PackageReservationDTO;
import com.oracle.ohTravel.member.model.TicketReservationDTO;

public interface MemberService {
	
	// 로그인
	public MemberDTO login(MemberDTO memberDTO);

	// 회원가입
	public int register(MemberDTO memberDTO);
	
	// 호텔 예약 내역
	public List<HotelReservationDTO> myPageReservHotel(HotelReservationDTO hotelReservationDTO);
	
	// 항공 예약 내역
	public List<AirReservationDTO> myPageReservAir(AirReservationDTO airReservationDTO);

	// 티켓 예약 내역
	public List<TicketReservationDTO> myPageReservTicket(TicketReservationDTO ticketReservationDTO);

	// 패키지 예약 내역
	public List<PackageReservationDTO> myPageReservPackage(PackageReservationDTO packageReservationDTO);

	// 회원 탈퇴
	public int deleteMember(MemberDTO memberDTO);

	// 개인 정보 수정
	public int updateMember(MemberDTO memberDTO);
  
	// 아이디 중복 검사
	public int idCheck(String mem_id);
  
	// 아이디 찾기
	public MemberDTO findID(MemberDTO memberDTO);
	
	// 비밀번호 찾기
	public MemberDTO findPassword(MemberDTO memberDTO);
  
	// 회원 select (등급 까지 포함)
	MemberDTO selectMemberWithGrade(String mem_id) throws Exception;
	
	// 한 회원이 가진 쿠폰 select (쿠폰 테이블에선 쿠폰 이름과, 할인율만 가져옴)
	List<CouponDTO> selectMemberWithCoupon(String mem_id) throws Exception;

	// 비밀번호 변경
	public int updatePassword(MemberDTO memberDTO);
	
}
