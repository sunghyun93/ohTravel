package com.oracle.ohTravel.member.dao;

import java.util.List;
import java.util.Map;

import com.oracle.ohTravel.manager.model.CouponDTO;
import com.oracle.ohTravel.member.model.AirReservationDTO;
import com.oracle.ohTravel.member.model.AirReservationDetail;
import com.oracle.ohTravel.member.model.HotelReservationDTO;
import com.oracle.ohTravel.member.model.MemberDTO;
import com.oracle.ohTravel.member.model.PackageReservationDTO;
import com.oracle.ohTravel.member.model.ReviewDTO;
import com.oracle.ohTravel.member.model.TicketReservationDTO;
import com.oracle.ohTravel.member.model.UpdateMileGradeDTO;

public interface MemberDao {

	// 로그인
	public MemberDTO login(MemberDTO memberDTO);
	
	// 회원가입
	public int register(MemberDTO memberDTO);

	// 티켓 예약 내역
	public List<TicketReservationDTO> myPageReservTicket(TicketReservationDTO ticketReservationDTO);

	// 항공 예약 내역
	public List<AirReservationDetail> myPageReserveAirLine(Map<String, Object> map);

	// 호텔 예약 내역
	public List<HotelReservationDTO> myPageReservHotel(HotelReservationDTO hotelReservationDTO);

	// 패키지 예약 내역
	public List<PackageReservationDTO> myPageReservPackage(PackageReservationDTO packageReservationDTO);
	
	// 회원 (등급까지 같이 가져옴)
	MemberDTO selectMemberWithGrade(String mem_id) throws Exception;
	
	// 한 회원이 가진 쿠폰 select (쿠폰 테이블에선 쿠폰 이름과, 할인율만 가져옴)
	List<CouponDTO> selectMemberWithCoupon(String mem_id) throws Exception;

	// 회원 탈퇴
	public int deleteMember(MemberDTO memberDTO);

	// 개인 정보 수정
	public int updateMember(MemberDTO memberDTO);

	// 회원 마일리지 update
	int updateMemMileage(Map<String, Object> map) throws Exception;
	
	// 프로시저 사용 (업데이트가 성공적으로 되면 매개변수로 던져준 updateMile 의 result 컬럼이 0(기본값) 에서 1로 변경되어 있음)
	// 회원 마일리지 변동에 따른 마일리지 등급 변경 (기준 마일리지를 넘거나 내려갔을 시 그에 맞는 마일리지 등급으로 변경
	void updateMemMileGrade(UpdateMileGradeDTO updateMile) throws Exception;

	// 아이디 중복 검사
	public int idCheck(String mem_id);


	// 회원이 쿠폰 사용 시 해당 쿠폰 사용 컬럼 1로 update
	int updateMemCouponUsed(Map<String, Object> map) throws Exception;

	// 아이디 찾기
	public MemberDTO findID(MemberDTO memberDTO);

	// 비밀번호 찾기
	public MemberDTO findPassword(MemberDTO memberDTO);

	// 비밀번호 변경
	public int updatePassword(MemberDTO memberDTO);

	// 패키지 리뷰 목록
	public List<ReviewDTO> mypageReviewPackage(ReviewDTO reviewDTO);

	// 호텔 리뷰 목록
	public List<ReviewDTO> mypageReviewHotel(ReviewDTO reviewDTO);


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


}

