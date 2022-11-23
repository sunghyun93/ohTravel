package com.oracle.ohTravel.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
	// 로그인
	@GetMapping(value = "/loginForm")
	public String goLoginForm() {
		return "member/loginForm";
	}
	
	// 회원가입
	@GetMapping(value = "/memberForm") 
	public String goMemberForm() {
		return "member/memberForm";
	}
	
	// 아이디 찾기
	@GetMapping(value = "/findID")
	public String goFindID() {
		return "member/findID";
	}
	
	// 비밀번호 찾기
	@GetMapping(value = "/findPassword")
	public String goFindPassword() {
		return "member/findPassword";
	}
	
	// 마이페이지 메인
	@GetMapping(value = "/myPageMain")
	public String goMyPageMain() {
		return "member/myPageMain";
	}
	// 패키지 예약 내역
	@GetMapping(value = "/myPageReservPackage")
	public String goMyPageReservPackage() {
		return "member/myPageReservPackage";
	}
	
	// 호텔 예약 내역
	@GetMapping(value = "/myPageReservHotel")
	public String goMyPageReservHotel() {
		return "member/myPageReservHotel";
	}
	
	// 항공 예약 내역
	@GetMapping(value = "/myPageReservAir")
	public String goMyPageReservAir() {
		return "member/myPageReservAir";
	}
	
	// 티켓 예약 내역
	@GetMapping(value = "/myPageReservTicket")
	public String goMyPageReservTicket() {
		return "member/myPageReservTicket";
	}
	
	// 패키지 찜
	@GetMapping(value = "/myPageLikePackage")
	public String goMyPageLikePackage() {
		return "member/myPageLikePackage";
	}
	
	// 호텔 찜
	@GetMapping(value = "/myPageLikeHotel")
	public String goMyPageLikeHotel() {
		return "member/myPageLikeHotel";
	}
	
	// 티켓 찜
	@GetMapping(value = "/myPageLikeTicket")
	public String goMyPageLikeTicket() {
		return "member/myPageLikeTicket";
	}
	
	// 쿠폰함(패키지)
	@GetMapping(value = "/myPageCouponPackage")
	public String goMyPageCouponPackage() {
		return "member/myPageCouponPackage";
	}
	
	// 쿠폰함(호텔)
	@GetMapping(value = "/myPageCouponHotel")
	public String goMyPageCouponHotel() {
		return "member/myPageCouponHotel";
	}
	
	// 쿠폰함(항공)
	@GetMapping(value = "/myPageCouponAir")
	public String goMyPageCouponAir() {
		return "member/myPageCouponAir";
	}
	
	// 쿠폰함(티켓)
	@GetMapping(value = "/myPageCouponTicket")
	public String goMyPageCouponTicket() {
		return "member/myPageCouponTicket";
	}
	
	// 자주 찾는 질문
	@GetMapping(value = "/myPageFAQ")
	public String goMyPageFAQ() {
		return "member/myPageFAQ";
	}
	
	// My 상품평 (패키지)
	@GetMapping(value = "/myPageReviewPackage")
	public String goMyPageReviewPackage() {
		return "member/myPageReviewPackage";
	}
	
	// My 상품평 (호텔)
	@GetMapping(value = "/myPageReviewHotel")
	public String goMyPageReviewHotel() {
		return "member/myPageReviewHotel";
	}
	
	// My 상품평 (티켓)
	@GetMapping(value = "/myPageReviewTicket")
	public String goMyPageReviewTicket() {
		return "member/myPageReviewTicket";
	}
	
	// 개인정보 메인
	@GetMapping(value = "/myPagePrivacy")
	public String goMyPagePrivacy() {
		return "member/myPagePrivacy";
	}
}
