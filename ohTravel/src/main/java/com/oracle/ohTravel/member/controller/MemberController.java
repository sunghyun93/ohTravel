package com.oracle.ohTravel.member.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oracle.ohTravel.member.model.AirReservationDTO;
import com.oracle.ohTravel.member.model.HotelReservationDTO;
import com.oracle.ohTravel.member.model.MemberDTO;
import com.oracle.ohTravel.member.model.PackageReservationDTO;
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
	public String login(MemberDTO memberDTO, HttpServletRequest request, RedirectAttributes rttr) {
		log.info("MemberController login Start..");
		
		HttpSession session = request.getSession();
		MemberDTO member = memberService.login(memberDTO);
		
		if(member != null) {
			// session에 로그인 정보 저장
			session.setAttribute("member", member);
			String sessionId = member.getMem_id();
			String sessionName = member.getMem_name();
			String sessionEmail = member.getMem_email();
			String sessionTel = member.getMem_tel();
			Date sessionBirth = (Date) member.getMem_birthday();
			
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
			String sessionBirthday = simpleDateFormat.format(sessionBirth); 
			
			
			session.setAttribute("sessionId", sessionId);
			session.setAttribute("sessionName", sessionName);
			session.setAttribute("sessionEmail", sessionEmail);
			session.setAttribute("sessionTel", sessionTel);
			session.setAttribute("sessionBirthday", sessionBirthday);
			
			System.out.println("MemberController login member -> " + member);
			System.out.println("MemberController login sessionId -> " + sessionId);
			System.out.println("MemberController login sessionName -> " + sessionName);
			System.out.println("MemberController login sessionEmail -> " + sessionEmail);
			System.out.println("MemberController login sessionTel -> " + sessionTel);
			System.out.println("MemberController login sessionBirthday -> " + sessionBirthday);
			return "redirect:/";
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			System.out.println("MemberController login msg -> " + rttr.getAttribute("msg"));
			return "redirect:/member/loginForm";
		}
		
		
	}
	
	// 로그아웃
	@GetMapping(value = "/logout")
	public String logout(HttpSession session) {
		log.info("MemberController logout start.. ");
		session.invalidate();

		return "redirect:/";
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
		
		// 회원가입 서비스 실행
		memberService.register(memberDTO);
		mav.setViewName("redirect:/member/loginForm"); 
		
		return mav;
	}
	
	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChk(String mem_id) throws Exception {
		log.info("MemberController memberIdChk start..");
		
		int result = memberService.idCheck(mem_id);
		
		log.info("MemberController memberIdChk result -> " + result);
		
		if(result != 0) {
			return "fail";	// 중복 아이디가 존재
		} else {
			return "success";	// 중복 아이디 X
		}
	}
	
	// 아이디 찾기 페이지 이동
	@GetMapping(value = "/findID")
	public String goFindID() {
		return "member/findID";
	}
	
	// 아이디 찾기
	@PostMapping(value = "/findID") 
	public String findID(MemberDTO memberDTO,Model model) {
		log.info("MemberController findID start..");
		MemberDTO member = memberService.findID(memberDTO);
		System.out.println("MemberController findID member " + member);
		
		if(member == null) {
			model.addAttribute("check", 1);
			model.addAttribute("msg", false);
			System.out.println("MemberController findID check ->" + model.getAttribute("check"));
			return "member/findIDResult";
		} else {
			model.addAttribute("member", member);
			model.addAttribute("check", 0);
			model.addAttribute("id", member.getMem_id());
			System.out.println("MemberController findID check ->" + model.getAttribute("check"));
			return "member/findIDResult";
		}
		
	}
	
	// 아이디 찾기 결과 페이지 이동
	@GetMapping(value = "/findIDResult")
	public String findIDResult() {
		return "member/findIDResult";
	}
	
	// 비밀번호 찾기 페이지 이동
	@GetMapping(value = "/findPassword")
	public String goFindPassword() {
		return "member/findPassword";
	}
	
	// 마이페이지 메인  페이지 이동
	@GetMapping(value = "/myPageMain")
	public String goMyPageMain(HttpSession session) {
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "member/loginForm";
		}
		return "member/myPageMain";
	}
	
	// 패키지 예약 내역 페이지 이동
	@RequestMapping(value = "/myPageReservPackage")
	public String myPageReservPackage(PackageReservationDTO packageReservationDTO, Model model, HttpServletRequest request) {
		log.info("MemberController myPageReservPackage start..");
		HttpSession session = request.getSession();
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "member/loginForm";
		}
		// session에 로그인 된 아이디 정보
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String sessionId = member.getMem_id();
		System.out.println("MemberController myPageReservPackage sessionId -> " + sessionId );
		
		// 페이징 나중에
		
		// 호텔 예약 내역
		packageReservationDTO.setMem_id(sessionId);
		List<PackageReservationDTO> packageReservList = memberService.myPageReservPackage(packageReservationDTO);
		model.addAttribute("packageReservList", packageReservList);
		System.out.println("MemberController packageReservList.size() -> " + packageReservList.size());
		
		return "member/myPageReservPackage";
	}
	
	// 호텔 예약 내역 페이지 이동
	@RequestMapping(value = "/myPageReservHotel")
	public String myPageReservHotel(HotelReservationDTO hotelReservationDTO, Model model, HttpServletRequest request) {
		log.info("MemberController myPageReservHotel start..");
		HttpSession session = request.getSession();
		
		// session에 로그인 된 아이디 정보
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String sessionId = member.getMem_id();
		System.out.println("MemberController myPageReservHotel sessionId -> " + sessionId );
		
		// 페이징 나중에
		
		// 호텔 예약 내역
		hotelReservationDTO.setMem_id(sessionId);
		List<HotelReservationDTO> hotelReservList = memberService.myPageReservHotel(hotelReservationDTO);
		model.addAttribute("hotelReservList", hotelReservList);
		System.out.println("MemberController hotelReservList.size() -> " + hotelReservList.size());
		
		return "member/myPageReservHotel";
	}
	
	// 항공 예약 내역 페이지 이동 페이지 이동
	@RequestMapping(value = "/myPageReservAir")
	public String myPageReservAir(AirReservationDTO airReservationDTO, Model model, HttpServletRequest request) {
		log.info("MemberController myPageReservAir start..");
		HttpSession session = request.getSession();
		
		// session에 로그인 된 아이디 정보
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String sessionId = member.getMem_id();
		System.out.println("MemberController myPageReservAir sessionId -> " + sessionId );
		
		// 페이징 나중에
		
		
		// 호텔 예약 내역
		airReservationDTO.setMem_id(sessionId);
		List<AirReservationDTO> airReservList = memberService.myPageReservAir(airReservationDTO);
		model.addAttribute("airReservList", airReservList);
		System.out.println("MemberController airReservList.size() -> " + airReservList.size());
		
		return "member/myPageReservAir";
	}
	
	// 티켓 예약 내역 조회
	@RequestMapping(value = "/myPageReservTicket")
	public String myPageReservTicket(TicketReservationDTO ticketReservationDTO, Model model, HttpServletRequest request) {
		log.info("MemberController myPageReservTicket start..");
		HttpSession session = request.getSession();
		
		// session에 로그인 된 정보
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String sessionId = member.getMem_id();
		System.out.println("MemberController myPageReservTicket sessionId -> " + sessionId);
		
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
	
	// 개인 정보 수정
	@PostMapping(value = "/updateMember")
	public String updateMember(MemberDTO memberDTO, HttpServletRequest request) {
		log.info("MemberController updateMember start..");
		
		HttpSession session = request.getSession();
		
		memberService.updateMember(memberDTO);
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 비밀번호 변경 페이지 이동
	@GetMapping(value = "/modifyPassword")
	public String goModifyPassword() {
		return "member/modifyPassword";
	}
	
	
	
	// 비밀번호 변경
	@PostMapping(value = "/updatePassword")
	public String updatePassword(MemberDTO memberDTO, HttpServletRequest request, RedirectAttributes rttr) {
		log.info("MemberController updatePassword start..");
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		
		// session에 저장된 로그인된 아이디의 비밀번호
		String sessionPw = member.getMem_password();
		System.out.println("MemberController updatePassword sessionPw -> "  + sessionPw);
		
		
		// 비밀번호 확인을 위해 새로 입력한 비밀번호
		String testPw = memberDTO.getMem_password();
		System.out.println("MemberController updatePassword testPw -> " + testPw);
		
		String newPw = null;
		
		if(!(sessionPw.equals(testPw))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/updatePassword";
		} else {
			member.setMem_password(testPw);
			memberService.updatePassword(member);
			session.invalidate();
			System.out.println("MemberController updatePassword after..");
			return "redirect:/";
		}
	}
	
	// 회원 탈퇴 페이지 이동
	@GetMapping(value = "/deleteMember")
	public String goDeleteMember() {
		return "member/deleteMember";
	}
	
	// 회원 탈퇴
	@PostMapping(value = "/deleteMember")
	public String deleteMemeber(MemberDTO memberDTO, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		log.info("MemberController deleteMemeber Start..");
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		
		// session에 저장된 로그인된 아이디의 비밀번호
		String sessionPw = member.getMem_password();
		System.out.println("MemberController deleteMemeber sessionPw -> "  + sessionPw);
		
		// 비밀번호 확인을 위해 새로 입력한 비밀번호
		String delPw = memberDTO.getMem_password();
		System.out.println("MemberController deleteMemeber delPw -> " + delPw);
		
		if(!(sessionPw.equals(delPw))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/deleteMember";
		} else {
			memberService.deleteMember(member);
			session.invalidate();
			System.out.println("MemberController deleteMemeber after..");
			return "redirect:/";
		}
		
		
	}
	
	// 결제 step1 페이지 이동
	@GetMapping(value = "/payment01")
	public String goPayment01() {
		return "member/payment01";
	}
}
