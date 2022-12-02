package com.oracle.ohTravel.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.ohTravel.member.model.MemberDTO;
import com.oracle.ohTravel.member.model.TicketReservationDTO;
import com.oracle.ohTravel.member.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
@Slf4j
public class MemberController {
	@Autowired
	private MemberService memberService;

	// 로그인 페이지 이동
	@GetMapping(value = "/loginForm")
	public String goLoginForm() {
		return "member/loginForm";
	}
	
	// 로그인
	@PostMapping("/login")
	public String login(MemberDTO memberDTO, HttpServletRequest request) {
		log.info("MemberController login Start..");
		
		HttpSession session = request.getSession();
		MemberDTO res = memberService.login(memberDTO);
		
		if(res != null) {
			// session에 로그인 정보 저장
			session.setAttribute("res", res);
			String sessionId = res.getMem_id();
			session.setAttribute("sessionId", sessionId);
			System.out.println("MemberController login sessionId -> " + sessionId);
			return "redirect:/";
		} else {
			return "redirect:/member/login";
		}
		
	}
		
	// 회원가입 페이지 이동
	@GetMapping(value = "/memberForm") 
	public String goMemberForm() {
		log.info("MemberController goMemberForm start..");
		return "member/memberForm";
	}
	
	// 회원가입
	@PostMapping("/register") 
	public ModelAndView register(MemberDTO memberDTO) {
		log.info("MemberController register Start... ");
		ModelAndView mav = new ModelAndView();
		memberService.register(memberDTO);
		mav.setViewName("redirect:/member/loginForm");
		return mav;
	}
	
	// 아이디 찾기 페이지 이동
	@GetMapping(value = "/findID")
	public String goFindID() {
		return "member/findID";
	}
	
	// 비밀번호 찾기 페이지 이동
	@GetMapping(value = "/findPassword")
	public String goFindPassword() {
		return "member/findPassword";
	}
	
	// 마이페이지 메인  페이지 이동
	@GetMapping(value = "/myPageMain")
	public String goMyPageMain() {
		return "member/myPageMain";
	}
	
	// 패키지 예약 내역 페이지 이동
	@GetMapping(value = "/myPageReservPackage")
	public String goMyPageReservPackage() {
		return "member/myPageReservPackage";
	}
	
	// 호텔 예약 내역 페이지 이동
	@GetMapping(value = "/myPageReservHotel")
	public String goMyPageReservHotel() {
		return "member/myPageReservHotel";
	}
	
	// 항공 예약 내역 페이지 이동 페이지 이동
	@GetMapping(value = "/myPageReservAir")
	public String goMyPageReservAir() {
		return "member/myPageReservAir";
	}
	
	// 티켓 예약 내역 조회
	@RequestMapping(value = "/myPageReservTicket")
	public String myPageReservTicket(TicketReservationDTO ticketReservationDTO, Model model, HttpServletRequest request) {
		log.info("MemberController myPageReservTicket start..");
		HttpSession session = request.getSession();
		
		// session에 로그인 된 아이디 정보
		MemberDTO res = (MemberDTO) session.getAttribute("res");
		String sessionId = res.getMem_id();
		System.out.println("MemberController myPageReservTicket sessionId -> " + sessionId );
		
		// 페이징 나중에
		
		// 티켓 예약 내역
		// ticketReservationDTO에 mem_id를 세션에 로그인 된 id값으로 설정
		ticketReservationDTO.setMem_id(sessionId);
		List<TicketReservationDTO> ticketReservList = memberService.myPageReservTicket(ticketReservationDTO);
		model.addAttribute("ticketReservList", ticketReservList);
		System.out.println("MemberController ticketReservList.size() -> " + ticketReservList.size());
		
		return "member/myPageReservTicket";
	}
	
	// 패키지 찜 페이지 이동
	@GetMapping(value = "/myPageLikePackage")
	public String goMyPageLikePackage() {
		return "member/myPageLikePackage";
	}
	
	// 호텔 찜 페이지 이동
	@GetMapping(value = "/myPageLikeHotel")
	public String goMyPageLikeHotel() {
		return "member/myPageLikeHotel";
	}
	
	// 티켓 찜 페이지 이동
	@GetMapping(value = "/myPageLikeTicket")
	public String goMyPageLikeTicket() {
		return "member/myPageLikeTicket";
	}
	
	// 쿠폰함(패키지) 페이지 이동
	@GetMapping(value = "/myPageCouponPackage")
	public String goMyPageCouponPackage() {
		return "member/myPageCouponPackage";
	}
	
	// 쿠폰함(호텔) 페이지 이동
	@GetMapping(value = "/myPageCouponHotel")
	public String goMyPageCouponHotel() {
		return "member/myPageCouponHotel";
	}
	
	// 쿠폰함(항공) 페이지 이동
	@GetMapping(value = "/myPageCouponAir")
	public String goMyPageCouponAir() {
		return "member/myPageCouponAir";
	}
	
	// 쿠폰함(티켓) 페이지 이동
	@GetMapping(value = "/myPageCouponTicket")
	public String goMyPageCouponTicket() {
		return "member/myPageCouponTicket";
	}
	
	// 자주 찾는 질문 페이지 이동
	@GetMapping(value = "/myPageFAQ")
	public String goMyPageFAQ() {
		return "member/myPageFAQ";
	}
	
	// My 상품평 (패키지) 페이지 이동
	@GetMapping(value = "/myPageReviewPackage")
	public String goMyPageReviewPackage() {
		return "member/myPageReviewPackage";
	}
	
	// My 상품평 (호텔) 페이지 이동
	@GetMapping(value = "/myPageReviewHotel")
	public String goMyPageReviewHotel() {
		return "member/myPageReviewHotel";
	}
	
	// My 상품평 (티켓) 페이지 이동
	@GetMapping(value = "/myPageReviewTicket")
	public String goMyPageReviewTicket() {
		return "member/myPageReviewTicket";
	}
	
	// 개인정보 메인 페이지 이동
	@GetMapping(value = "/myPagePrivacy")
	public String goMyPagePrivacy() {
		return "member/myPagePrivacy";
	}
	
	// 개인 정보 수정 페이지 이동
	@GetMapping(value = "/modifyMember") 
	public String goModifyMember() {
		return "member/modifyMember";
	}
	
	// 비밀번호 변경 페이지 이동
	@GetMapping(value = "/modifyPassword")
	public String goModifyPassword() {
		return "member/modifyPassword";
	}
	
	// 회원 탈퇴 페이지 이동
	@GetMapping(value = "/deleteMember")
	public String goDeleteMember() {
		return "member/deleteMember";
	}
	
	// 결제 step1 페이지 이동
	@GetMapping(value = "/payment01")
	public String goPayment01() {
		return "member/payment01";
	}
}
