package com.oracle.ohTravel.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.manager.model.CouponDTO;
import com.oracle.ohTravel.member.model.AirReservationDTO;
import com.oracle.ohTravel.member.model.AirReservationDetail;
import com.oracle.ohTravel.member.model.BasketDTO;
import com.oracle.ohTravel.member.model.HotelReservationDTO;
import com.oracle.ohTravel.member.model.MemberDTO;
import com.oracle.ohTravel.member.model.PackageReservationDTO;
import com.oracle.ohTravel.member.model.ReviewDTO;
import com.oracle.ohTravel.member.model.TicketReservationDTO;
import com.oracle.ohTravel.member.model.UpdateMileGradeDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSession sqlSession;
	
	// 로그인
	@Override
	public MemberDTO login(MemberDTO memberDTO) {
		log.info("MemberDaoImpl login Start..");
		MemberDTO res = null;
		
		try {
			res = sqlSession.selectOne("login", memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	// 회원가입
	@Override
	public int register(MemberDTO memberDTO) {
		log.info("MemberDaoImpl register Start..");
		int result = sqlSession.insert("register", memberDTO);
		
		return result;
	}

	// 티켓 예약 내역
	@Override
	public List<TicketReservationDTO> myPageReservTicket(TicketReservationDTO ticketReservationDTO) {
		log.info("MemberDaoImpl myPageReservTicket Start..");
		List<TicketReservationDTO> ticketReservList = sqlSession.selectList("ticketReservList", ticketReservationDTO);
		
		System.out.println("MemberDaoImpl myPageReservTicket ticketReservList.size() -> "+ ticketReservList.size());
		return ticketReservList;
	}

	//항공 예약 내역
	@Override
	public List<AirReservationDetail> myPageReserveAirLine(Map<String, Object> map) {
		
		List<AirReservationDetail> airReservList = sqlSession.selectList("airReservList",map);
		System.out.println("MemberDaoImpl myPageReserveAirLine airReservList.size() -> "+ airReservList.size());
		return airReservList;
	}

	// 호텔 예약 내역
	@Override
	public List<HotelReservationDTO> myPageReservHotel(HotelReservationDTO hotelReservationDTO) {
		log.info("MemberDaoImpl myPageReservHotel Start..");
		List<HotelReservationDTO> hotelReservList = sqlSession.selectList("hotelReservList", hotelReservationDTO);
		
		System.out.println("MemberDaoImpl myPageReservHotel hotelReservList.size() -> " + hotelReservList.size());
		return hotelReservList;
	}

	// 패키지 예약 내역
	@Override
	public List<PackageReservationDTO> myPageReservPackage(PackageReservationDTO packageReservationDTO) {
		log.info("MemberDaoImpl myPageReservPackage Start..");
		List<PackageReservationDTO> packageReservList = sqlSession.selectList("packageReservList", packageReservationDTO);
		
		System.out.println("MemberDaoImpl myPageReservPackage packageReservList.size() -> " + packageReservList.size());
		return packageReservList;
	}

	// 회원 탈퇴
	@Override
	public int deleteMember(MemberDTO memberDTO) {
		log.info("MemberDaoImpl deleteMember start..");
		int result = sqlSession.delete("deleteMember", memberDTO);
		System.out.println("MemberDaoImpl deleteMember memberDTO.getMem_id() -> " + memberDTO.getMem_id());
		
		return result;
	}

	// 개인 정보 수정
	@Override
	public int updateMember(MemberDTO memberDTO) {
		log.info("MemberDaoImpl updateMember start..");
		
		int result = sqlSession.update("updateMember", memberDTO);
		
		return result;
	}

	
	// 아이디 중복 체크
	@Override
	public int idCheck(String mem_id) {
		log.info("MemberDaoImpl idCheck start..");
		
		int result = sqlSession.selectOne("idCheck", mem_id);
		
		return result;
	}
	
	// 아이디 찾기
	@Override
	public MemberDTO findID(MemberDTO memberDTO) {
		log.info("MemberDaoImpl findID start..");
		
		MemberDTO member = sqlSession.selectOne("findID", memberDTO);
		System.out.println("MemberDaoImpl findID member -> " + member);
		
		return member;
	}

	// 비밀번호 찾기
	@Override
	public MemberDTO findPassword(MemberDTO memberDTO) {
		log.info("MemberDaoImpl findID start..");
		
		MemberDTO member = sqlSession.selectOne("findPassword", memberDTO);
		System.out.println("MemberDaoImpl findPassword member -> " + member);
		
		return member;
	}

	// 회원 select (등급 까지 포함)
	@Override
	public MemberDTO selectMemberWithGrade(String mem_id) throws Exception {
		log.info("MemberDaoImpl selectMemberWithGrade() start...");
		MemberDTO memberDTO = sqlSession.selectOne("selectMemberWithGrade", mem_id);
		log.info("MemberDaoImpl selectMemberWithGrade() end...");
		return memberDTO;
	}
	
	// 한 회원이 가진 쿠폰 select (쿠폰 테이블에선 쿠폰 이름과, 할인율만 가져옴)
	@Override
	public List<CouponDTO> selectMemberWithCoupon(String mem_id) throws Exception {
		log.info("MemberDaoImpl selectMemberWithCoupon() start...");
		List<CouponDTO> list = sqlSession.selectList("selectMemberWithCoupon", mem_id);
		log.info("MemberDaoImpl selectMemberWithCoupon() end...");
		return list;
	}
	
	// 회원 마일리지 update
	@Override
	public int updateMemMileage(Map<String, Object> map) throws Exception {
		log.info("MemberDaoImpl updateMemMileage() start...");
		int rowCnt = sqlSession.update("updateMemMileage", map);
		log.info("MemberDaoImpl updateMemMileage() end...");
		return rowCnt;
	}
	
	// 프로시저 사용 (업데이트가 성공적으로 되면 매개변수로 던져준 updateMile 의 result 컬럼이 0(기본값) 에서 1로 변경되어 있음)
	// 회원 마일리지 변동에 따른 마일리지 등급 변경 (기준 마일리지를 넘거나 내려갔을 시 그에 맞는 마일리지 등급으로 변경)
	@Override
	public void updateMemMileGrade(UpdateMileGradeDTO updateMile) throws Exception {
		log.info("MemberDaoImpl updateMemMileGrade() start...");
		log.info("updateMile = " + updateMile);
		sqlSession.selectOne("updateMemMileGrade", updateMile);
		log.info("MemberDaoImpl updateMemMileGrade() end...");
//		return rowCnt;
	}
	
	// 회원이 쿠폰 사용 시 해당 쿠폰 사용 컬럼 1로 update
	@Override
	public int updateMemCouponUsed(Map<String, Object> map) throws Exception {
		log.info("MemberDaoImpl updateMemCouponUsed() start...");
		int rowCnt = sqlSession.update("updateMemCouponUsed", map);
		log.info("MemberDaoImpl updateMemCouponUsed() end...");
		return rowCnt;
	}

	// 비밀번호 변경
	@Override
	public int updatePassword(MemberDTO memberDTO) {
		log.info("MemberDaoImpl updatePassword start..");
		
		int result = sqlSession.update("updatePassword", memberDTO);
		
		return result;
	}

	// 패키지 리뷰 목록
	@Override
	public List<ReviewDTO> mypageReviewPackage(ReviewDTO reviewDTO) {
		log.info("MemberDaoImpl mypageReviewPackage Start..");
		List<ReviewDTO> packageReviewList = sqlSession.selectList("packageReviewList", reviewDTO);
		
		System.out.println("MemberDaoImpl mypageReviewPackage packageReviewList.size() -> " + packageReviewList.size());
		return packageReviewList;
	}

	// 호텔 리뷰 목록
	@Override
	public List<ReviewDTO> mypageReviewHotel(ReviewDTO reviewDTO) {
		log.info("MemberDaoImpl mypageReviewHotel Start..");
		List<ReviewDTO> hotelReviewList = sqlSession.selectList("hotelReviewList", reviewDTO);
		
		System.out.println("MemberDaoImpl mypageReviewHotel hotelReviewList.size() -> " + hotelReviewList.size());
		return hotelReviewList;
	}
	
	

	// 티켓 리뷰 목록
	@Override
	public List<ReviewDTO> myPageReviewTicket(ReviewDTO reviewDTO) {
		log.info("MemberDaoImpl myPageReviewTicket Start..");
		List<ReviewDTO> ticketReviewList = sqlSession.selectList("ticketReviewList", reviewDTO);
		
		System.out.println("MemberDaoImpl myPageReviewTicket ticketReviewList.size() -> " + ticketReviewList.size());
		return ticketReviewList;
	}

	// 패키지 리뷰 총 개수
	@Override
	public int totalReviewPackage(ReviewDTO reviewDTO) {
		log.info("MemberDaoImpl totalReviewPackage start..");
		int total = sqlSession.selectOne("totalReviewPackage", reviewDTO);
		System.out.println("MemberDaoImpl totalReviewPackage total -> " + total);
		return total;
	}

	// 호텔 리뷰 총 개수
	@Override
	public int totalReviewHotel(ReviewDTO reviewDTO) {
		log.info("MemberDaoImpl totalReviewHotel start..");
		int total = sqlSession.selectOne("totalReviewHotel", reviewDTO);
		System.out.println("MemberDaoImpl totalReviewHotel total -> " + total);
		return total;
	}

	// 티켓 리뷰 총 개수
	@Override
	public int totalReviewTicket(ReviewDTO reviewDTO) {
		log.info("MemberDaoImpl totalReviewTicket start..");
		int total = sqlSession.selectOne("totalReviewTicket", reviewDTO);
		System.out.println("MemberDaoImpl totalReviewTicket total -> " + total);
		return total;
	}

	// 패키지 예약 총 개수
	@Override
	public int totalReservPackage(PackageReservationDTO packageReservationDTO) {
		log.info("MemberDaoImpl totalReservPackage start..");
		int total = sqlSession.selectOne("totalReservPacakage", packageReservationDTO);
		System.out.println("MemberDaoImpl totalReservPackage total -> " + total);
		return total;
	}

	// 호텔 예약 총 개수
	@Override
	public int totalReservHotel(HotelReservationDTO hotelReservationDTO) {
		log.info("MemberDaoImpl totalReservHotel start..");
		int total = sqlSession.selectOne("totalReservHotel", hotelReservationDTO);
		System.out.println("MemberDaoImpl totalReservHotel total -> " + total);
		return total;
	}

	// 티켓 예약 총 개수
	@Override
	public int totalReservTicket(TicketReservationDTO ticketReservationDTO) {
		log.info("MemberDaoImpl totalReservTicket start..");
		int total = sqlSession.selectOne("totalReservTicket", ticketReservationDTO);
		System.out.println("MemberDaoImpl totalReservTicket total -> " + total);
		return total;
	}

	// 패키지 찜 내역
	@Override
	public List<BasketDTO> myPageLikePackage(BasketDTO basketDTO) {
		log.info("MemberDaoImpl myPageLikePackage start..");
		List<BasketDTO> packageLikeList = sqlSession.selectList("packageLikeList", basketDTO);
		System.out.println("MemberDaoImpl myPageLikePackage packageLikeList.size() -> " + packageLikeList.size());
		return packageLikeList;
	}

	// 호텔 찜 내역
	@Override
	public List<BasketDTO> myPageLikeHotel(BasketDTO basketDTO) {
		log.info("MemberDaoImpl myPageLikeHotel start..");
		List<BasketDTO> hotelLikeList = sqlSession.selectList("hotelLikeList", basketDTO);
		System.out.println("MemberDaoImpl myPageLikeHotel hotelLikeList.size() -> " + hotelLikeList.size());
		return hotelLikeList;
	}

	// 티켓 찜 내역
	@Override
	public List<BasketDTO> myPageLikeTicket(BasketDTO basketDTO) {
		log.info("MemberDaoImpl myPageLikeTicket start..");
		List<BasketDTO> ticketLikeList = sqlSession.selectList("ticketLikeList", basketDTO);
		System.out.println("MemberDaoImpl myPageLikeTicket ticketLikeList.size() -> " + ticketLikeList.size());
		return ticketLikeList;
	}


	
}
