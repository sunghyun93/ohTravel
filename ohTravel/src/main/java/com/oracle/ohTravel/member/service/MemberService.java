package com.oracle.ohTravel.member.service;

import java.util.List;
import java.util.Map;

import com.oracle.ohTravel.airport.model.Air_ReservationDTO;
import com.oracle.ohTravel.manager.model.CouponDTO;
import com.oracle.ohTravel.member.model.MemCouponDTO;
import com.oracle.ohTravel.member.model.AirReservationDetail;
import com.oracle.ohTravel.member.model.BasketDTO;
import com.oracle.ohTravel.member.model.HotelReservationDTO;
import com.oracle.ohTravel.member.model.MemberDTO;
import com.oracle.ohTravel.member.model.PackageReservationDTO;
import com.oracle.ohTravel.member.model.ReviewDTO;
import com.oracle.ohTravel.member.model.TicketReservationDTO;

public interface MemberService {
	
	// 로그인
	public MemberDTO login(MemberDTO memberDTO);

	// 회원가입
	public int register(MemberDTO memberDTO);
	
	// 호텔 예약 내역
	public List<HotelReservationDTO> myPageReservHotel(HotelReservationDTO hotelReservationDTO);
	
	// 항공 예약 내역
	//public List<AirReservationDTO> myPageReservAir(Air_ReservationDTO air_ReservationDTO);

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

	// 패키지 리뷰 목록
	public List<ReviewDTO> myPageReviewPackage(ReviewDTO reviewDTO);

	// 호텔 리뷰 목록
	public List<ReviewDTO> myPageReviewHotel(ReviewDTO reviewDTO);


	//항공예약내역
	public List<AirReservationDetail> myPageReservAir(String mem_id);

	// 티켓 리뷰 목록
	public List<ReviewDTO> myPageReviewTicket(ReviewDTO reviewDTO);

	// 패키지 리뷰 총 개수
	public int totalReviewPackage(ReviewDTO reviewDTO);

	// 호텔 리뷰 총 개수
	public int totalReviewHotel(ReviewDTO reviewDTO);

	// 티켓 리뷰 총 개수
	public int totalReviewTicket(ReviewDTO reviewDTO);

	// 패키지 예약 총 개수
	public int totalReservPackage(PackageReservationDTO packageReservationDTO);

	// 호텔 예약 총 개수
	public int totalReservHotel(HotelReservationDTO hotelReservationDTO);

	// 티켓 예약 총 개수
	public int totalReservTicket(TicketReservationDTO ticketReservationDTO);

	// 패키지 찜 내역
	public List<BasketDTO> myPageLikePackage(BasketDTO basketDTO);

	// 호텔 찜 내역
	public List<BasketDTO> myPageLikeHotel(BasketDTO basketDTO);

	// 티켓 찜 내역
	public List<BasketDTO> myPageLikeTicket(BasketDTO basketDTO);

	// 쿠폰 내역
	public List<MemCouponDTO> myPageCoupon(MemCouponDTO couponDTO);

	// 패키지 찜 삭제
	public int deleteLikePackage(BasketDTO basketDTO);

	// 호텔 찜 삭제
	public int deleteLikeHotel(BasketDTO basketDTO);

	// 티켓 찜 삭제
	public int deleteLikeTicket(BasketDTO basketDTO);





	
}
