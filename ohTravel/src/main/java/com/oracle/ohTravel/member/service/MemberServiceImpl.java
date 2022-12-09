package com.oracle.ohTravel.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.ohTravel.manager.model.CouponDTO;
import com.oracle.ohTravel.member.dao.MemberDao;
import com.oracle.ohTravel.member.domain.Member;
import com.oracle.ohTravel.member.model.AirReservationDetail;
import com.oracle.ohTravel.member.model.HotelReservationDTO;
import com.oracle.ohTravel.member.model.MemberDTO;
import com.oracle.ohTravel.member.model.PackageReservationDTO;
import com.oracle.ohTravel.member.model.ReviewDTO;
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
	public List<AirReservationDetail> myPageReservAir(Map<String, Object> map) {
		List<AirReservationDetail> airReserveList = memberDao.myPageReserveAirLine(map);
		return airReserveList;
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

	// 개인 정보 수정
	@Override
	public int updateMember(MemberDTO memberDTO) {
		log.info("MemberServiceImpl updateMember Start..");
		
		int result = memberDao.updateMember(memberDTO);
		
		return result;
	}

	// 아이디 중복 검사
	@Override
	public int idCheck(String mem_id) {
		log.info("MemberServiceImpl idCheck start..");
		return memberDao.idCheck(mem_id);
	}
	
	// 아이디 찾기
	@Override
	public MemberDTO findID(MemberDTO memberDTO) {
		log.info("MemberServiceImpl findID start..");
		return memberDao.findID(memberDTO);
	}

	// 비밀번호 찾기
	public MemberDTO findPassword(MemberDTO memberDTO) {
		log.info("MemberServiceImpl findPassword start..");
		return memberDao.findPassword(memberDTO);
	}
	
	// 회원 select (등급 까지 포함)
	@Override
	public MemberDTO selectMemberWithGrade(String mem_id) throws Exception {
		log.info("MemberServiceImpl selectMemberWithGrade() start...");
		MemberDTO memberDTO = memberDao.selectMemberWithGrade(mem_id);
		log.info("MemberServiceImpl selectMemberWithGrade() end...");
		return memberDTO;
	}
	
	// 한 회원이 가진 쿠폰 select (쿠폰 테이블에선 쿠폰 이름과, 할인율만 가져옴)
	@Override
	public List<CouponDTO> selectMemberWithCoupon(String mem_id) throws Exception {
		log.info("MemberServiceImpl selectMemberWithCoupon() start...");
		List<CouponDTO> list = memberDao.selectMemberWithCoupon(mem_id);
		log.info("MemberServiceImpl selectMemberWithCoupon() end...");
		return list;
	}

	// 비밀번호 변경
	@Override
	public int updatePassword(MemberDTO memberDTO) {
		log.info("MemberServiceImpl updatePassword start...");
		
		int result = memberDao.updatePassword(memberDTO);
		
		return result;
	}

	// 패키지 리뷰 목록
	@Override
	public List<ReviewDTO> myPageReviewPackage(ReviewDTO reviewDTO) {
		log.info("MemberServiceImpl myPageReviewPackage start...");
		List<ReviewDTO> packageReviewList = memberDao.mypageReviewPackage(reviewDTO);
		return packageReviewList;
	}
	
	// 호텔 리뷰 목록
	@Override
	public List<ReviewDTO> myPageReviewHotel(ReviewDTO reviewDTO) {
		log.info("MemberServiceImpl myPageReviewHotel start...");
		List<ReviewDTO> hotelReviewList = memberDao.mypageReviewHotel(reviewDTO);
		return hotelReviewList;
	}

	

	
	
	

	
}
