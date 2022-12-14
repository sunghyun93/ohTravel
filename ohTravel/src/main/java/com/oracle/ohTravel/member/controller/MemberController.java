package com.oracle.ohTravel.member.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.oracle.ohTravel.airport.model.Air_FlightSchDTO;
import com.oracle.ohTravel.airport.model.Air_ReservationDTO;
import com.oracle.ohTravel.airport.model.Air_ScheduleDTO;
import com.oracle.ohTravel.member.model.AirReservationDetail;
import com.oracle.ohTravel.member.model.BasketDTO;
import com.oracle.ohTravel.member.model.MemCouponDTO;
import com.oracle.ohTravel.member.model.HotelReservationDTO;
import com.oracle.ohTravel.member.model.MemberDTO;
import com.oracle.ohTravel.member.model.PackageReservationDTO;
import com.oracle.ohTravel.member.model.PagingManager;
import com.oracle.ohTravel.member.model.ReviewDTO;
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
		// 로그인 상태 저장 -> 0 이면 로그인 안된 상태, 1 이면 로그인 된 상태
		
		
		if(member != null) {
			// session에 로그인 정보 저장
			session.setAttribute("member", member);
			String sessionId = member.getMem_id();
			String sessionName = member.getMem_name();
			String sessionEmail = member.getMem_email();
			String sessionTel = member.getMem_tel();
			Date sessionBirth = (Date) member.getMem_birthday();
			String sessionPw = member.getMem_password();
			
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
			String sessionBirthday = simpleDateFormat.format(sessionBirth); 
			
			
			session.setAttribute("sessionId", sessionId);
			session.setAttribute("sessionName", sessionName);
			session.setAttribute("sessionEmail", sessionEmail);
			session.setAttribute("sessionTel", sessionTel);
			session.setAttribute("sessionBirthday", sessionBirthday);
			session.setAttribute("sessionPw", sessionPw);
			
			System.out.println("MemberController login member -> " + member);
			System.out.println("MemberController login sessionId -> " + sessionId);
			System.out.println("MemberController login sessionName -> " + sessionName);
			System.out.println("MemberController login sessionEmail -> " + sessionEmail);
			System.out.println("MemberController login sessionTel -> " + sessionTel);
			System.out.println("MemberController login sessionBirthday -> " + sessionBirthday);
			return "redirect:/";
		} else {
			session.setAttribute("member", null);
			// 로그인 안 된 상태 저장
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
	
	// 비밀번호 찾기
	@PostMapping(value = "/findPassword")
	public String findPassword(MemberDTO memberDTO, Model model, HttpSession session) {
		log.info("MemberController findPassword start..");
		
		MemberDTO member = memberService.findPassword(memberDTO);
		System.out.println("MemberController findID findPassword " + member);
		
		if(member == null) {
			model.addAttribute("check", 1);
			return "member/findPasswordResult";
			
		} else {
			session.setAttribute("sessionId", member.getMem_id());
			model.addAttribute("member", member);
			model.addAttribute("check", 0);
			model.addAttribute("id", member.getMem_id());
			session.setAttribute("pw", member.getMem_password());
			return "redirect:/member/modifyPassword2";
		}
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
	
	// 패키지 예약 내역 조회 
	@RequestMapping(value = "/myPageReservPackage")
	public String myPageReservPackage(PackageReservationDTO packageReservationDTO, Model model, String currentPage, HttpServletRequest request) {
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
		
		// 페이징
		packageReservationDTO.setMem_id(sessionId);
		int total = memberService.totalReservPackage(packageReservationDTO);
		System.out.println("MemberController myPageReviewPackage total -> " + total);
		PagingManager page = new PagingManager(total, currentPage);
		packageReservationDTO.setStart(page.getStart());
		packageReservationDTO.setEnd(page.getEnd());
		System.out.println("MemberController myPageReservPackage page.getStart() -> " + page.getStart());
		System.out.println("MemberController myPageReservPackage page.getEnd() -> " + page.getEnd());
		

		// 패키지 예약 내역
		List<PackageReservationDTO> packageReservList = memberService.myPageReservPackage(packageReservationDTO);
		int packageReservListSize = packageReservList.size();
		model.addAttribute("packageReservList", packageReservList);
		model.addAttribute("packageReservListSize", packageReservListSize);
		model.addAttribute("page", page);
		System.out.println("MemberController packageReservList.size() -> " + packageReservList.size());
		
		return "member/myPageReservPackage";
	}
	
	// 호텔 예약 내역 조회
	@RequestMapping(value = "/myPageReservHotel")
	public String myPageReservHotel(HotelReservationDTO hotelReservationDTO, Model model, String currentPage, HttpServletRequest request) {
		log.info("MemberController myPageReservHotel start..");
		HttpSession session = request.getSession();
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "member/loginForm";
		}

		// session에 로그인 된 아이디 정보
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String sessionId = member.getMem_id();
		System.out.println("MemberController myPageReservHotel sessionId -> " + sessionId );
		
		// 페이징 
		hotelReservationDTO.setMem_id(sessionId);
		int total = memberService.totalReservHotel(hotelReservationDTO);
		System.out.println("MemberController myPageReviewPackage total -> " + total);
		PagingManager page = new PagingManager(total, currentPage);
		hotelReservationDTO.setStart(page.getStart());
		hotelReservationDTO.setEnd(page.getEnd());
		System.out.println("MemberController myPageReservHotel page.getStart() -> " + page.getStart());
		System.out.println("MemberController myPageReservHotel page.getEnd() -> " + page.getEnd());
		
		// 호텔 예약 내역
		List<HotelReservationDTO> hotelReservList = memberService.myPageReservHotel(hotelReservationDTO);
		int hotelReservListSize = hotelReservList.size();
		model.addAttribute("hotelReservList", hotelReservList);
		model.addAttribute("hotelReservListSize", hotelReservListSize);
		model.addAttribute("page", page);
		System.out.println("MemberController hotelReservList.size() -> " + hotelReservList.size());
		
		return "member/myPageReservHotel";
	}
	
	// 항공 예약 내역 조회
	@RequestMapping(value = "/myPageReservAir")
	public String myPageReservAir(Air_ReservationDTO air_ReservationDTO,Air_FlightSchDTO air_FlightSchDTO,Air_ScheduleDTO air_ScheduleDTO, String currentPage, Model model, HttpServletRequest request) {
		log.info("MemberController myPageReservAir start..");
		HttpSession session = request.getSession();
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "member/loginForm";
		}
		// session에 로그인 된 아이디 정보
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String sessionId = member.getMem_id();
		System.out.println("MemberController myPageReservAir sessionId -> " + sessionId );
		
		// 페이징 나중에
		air_ReservationDTO.setMem_id(sessionId);
		
		
		
		// 항공 예약 내역
		Map<String,Object> map = new HashMap<>();
		map.put("air_ReservationDTO",air_ReservationDTO);
		map.put("air_FlightSchDTO",air_FlightSchDTO);
		map.put("air_ScheduleDTO",air_ScheduleDTO);
		
		List<AirReservationDetail> airReservList = memberService.myPageReservAir(map);
		int airReservListSize = airReservList.size();
		

		model.addAttribute("airReservList", airReservList);
		model.addAttribute("airReservListSize", airReservListSize);
		System.out.println("MemberController airReservListSize -> " + airReservListSize);
		
		return "member/myPageReservAir";
	}
	
	// 티켓 예약 내역 조회
	@RequestMapping(value = "/myPageReservTicket")
	public String myPageReservTicket(TicketReservationDTO ticketReservationDTO, Model model, String currentPage, HttpServletRequest request) {
		log.info("MemberController myPageReservTicket start..");
		HttpSession session = request.getSession();
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "member/loginForm";
		}
		// session에 로그인 된 정보
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String sessionId = member.getMem_id();
		System.out.println("MemberController myPageReservTicket sessionId -> " + sessionId);
		
		// 페이징
		ticketReservationDTO.setMem_id(sessionId);
		int total = memberService.totalReservTicket(ticketReservationDTO);
		System.out.println("MemberController myPageReservTicket total -> " + total);
		PagingManager page = new PagingManager(total, currentPage);
		ticketReservationDTO.setStart(page.getStart());
		ticketReservationDTO.setEnd(page.getEnd());
		System.out.println("MemberController myPageReservTicket page.getStart() -> " + page.getStart());
		System.out.println("MemberController myPageReservTicket page.getEnd() -> " + page.getEnd());
		
		// 티켓 예약 내역
		// ticketReservationDTO에 mem_id를 세션에 로그인 된 id값으로 설정
		List<TicketReservationDTO> ticketReservList = memberService.myPageReservTicket(ticketReservationDTO);
		int ticketReservListSize = ticketReservList.size();
		model.addAttribute("ticketReservList", ticketReservList);
		model.addAttribute("ticketReservListSize", ticketReservListSize);
		model.addAttribute("page", page);
		System.out.println("MemberController ticketReservList.size() -> " + ticketReservList.size());
		
		return "member/myPageReservTicket";
	}
	
	// 패키지 찜 
	@RequestMapping(value = "/myPageLikePackage")
	public String myPageLikePackage(BasketDTO basketDTO, Model model, String currentPage, HttpServletRequest request) {
		log.info("MemberController myPageLikePackage start..");
		HttpSession session = request.getSession();
		
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "member/loginForm";
		}
		
		// session에 로그인 된 아이디 정보
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String sessionId = member.getMem_id();
		
		System.out.println("MemberController myPageLikePackage sessionId -> " + sessionId );
		

		basketDTO.setMem_id(sessionId);
		
		// 패키지 찜 내역
		List<BasketDTO> packageLikeList = memberService.myPageLikePackage(basketDTO);
		int packageLikeListSize = packageLikeList.size();
		model.addAttribute("packageLikeList", packageLikeList);
		model.addAttribute("packageLikeListSize", packageLikeListSize);
		System.out.println("MemberController myPageLikePackage basketDTO.getMem_id() -> " + basketDTO.getMem_id() );
		System.out.println("MemberController myPageLikePackage basketDTO.getBasket_id() -> " + basketDTO.getBasket_id() );
		System.out.println("MemberController myPageLikePackage basketDTO.getBasket_ref_id() -> " + basketDTO.getBasket_ref_id() );
		System.out.println("MemberController packageLikeList packageLikeListSize -> " + packageLikeListSize);
		
		return "member/myPageLikePackage";
	}
	
	// 호텔 찜 
	@RequestMapping(value = "/myPageLikeHotel")
	public String myPageLikeHotel(BasketDTO basketDTO, Model model, String currentPage, HttpServletRequest request) {
		log.info("MemberController myPageLikeHotel start..");
		HttpSession session = request.getSession();
		
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "member/loginForm";
		}
		
		// session에 로그인 된 아이디 정보
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String sessionId = member.getMem_id();
		
		System.out.println("MemberController myPageLikeHotel sessionId -> " + sessionId );
		System.out.println("MemberController myPageLikeHotel basketDTO -> " + basketDTO.getMem_id() );
		System.out.println("MemberController myPageLikeHotel basketDTO -> " + basketDTO.getBasket_id() );

		basketDTO.setMem_id(sessionId);
		
		// 호텔 찜 내역
		List<BasketDTO> hotelLikeList = memberService.myPageLikeHotel(basketDTO);
		int hotelLikeListSize = hotelLikeList.size();
		model.addAttribute("hotelLikeList", hotelLikeList);
		model.addAttribute("hotelLikeListSize", hotelLikeListSize);
		System.out.println("MemberController myPageLikeHotel hotelLikeListSize -> " + hotelLikeListSize);
		
		return "member/myPageLikeHotel";
	}
	
	// 티켓 찜 
	@RequestMapping(value = "/myPageLikeTicket")
	public String myPageLikeTicket(BasketDTO basketDTO, Model model, String currentPage, HttpServletRequest request) {
		log.info("MemberController myPageLikeTicket start..");
		HttpSession session = request.getSession();
		
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "member/loginForm";
		}
		
		// session에 로그인 된 아이디 정보
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String sessionId = member.getMem_id();
		
		System.out.println("MemberController myPageLikeTicket sessionId -> " + sessionId );
		System.out.println("MemberController myPageLikeTicket basketDTO -> " + basketDTO.getMem_id() );
		System.out.println("MemberController myPageLikeTicket basketDTO -> " + basketDTO.getBasket_id() );

		// 페이징은 나중에
		basketDTO.setMem_id(sessionId);
		
		// 티켓 찜 내역
		List<BasketDTO> ticketLikeList = memberService.myPageLikeTicket(basketDTO);
		int ticketLikeListSize = ticketLikeList.size();
		model.addAttribute("ticketLikeList", ticketLikeList);
		model.addAttribute("ticketLikeListSize", ticketLikeListSize);
		System.out.println("MemberController myPageLikeTicket ticketLikeListSize -> " + ticketLikeListSize);
		
		return "member/myPageLikeTicket";
	}
	
	// 패키지 찜 삭제
	@RequestMapping(value = "/deleteLikePackage")
	public String deleteLikePackage(BasketDTO basketDTO, HttpServletRequest request) {
		log.info("MemberController deleteLikePackage start..");
		System.out.println("MemberController deleteLikePackage basketDTO.getBasket_ref_id() ->" + basketDTO.getBasket_ref_id());
		HttpSession session = request.getSession();
		
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "member/loginForm";
		}
		
		// session에 로그인 된 아이디 정보
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String sessionId = member.getMem_id();
		
		basketDTO.setMem_id(sessionId);
		
		int result = memberService.deleteLikePackage(basketDTO);
		System.out.println("MemberController deleteLikePackage result -> " + result);
		
		return "redirect:/member/myPageLikePackage";
	}
	
	// 호텔 찜 삭제
	@RequestMapping(value = "/deleteLikeHotel")
	public String deleteLikeHotel(BasketDTO basketDTO, HttpServletRequest request) {
		log.info("MemberController deleteLikeHotel start..");
		System.out.println("MemberController deleteLikeHotel basketDTO.getBasket_ref_id() ->" + basketDTO.getBasket_ref_id());
		HttpSession session = request.getSession();
		
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "member/loginForm";
		}
		
		// session에 로그인 된 아이디 정보
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String sessionId = member.getMem_id();
		
		basketDTO.setMem_id(sessionId);
		
		int result = memberService.deleteLikeHotel(basketDTO);
		System.out.println("MemberController deleteLikeHotel result -> " + result);
		
		return "redirect:/member/myPageLikeHotel";
	}
	
	// 티켓 찜 삭제
	@RequestMapping(value = "/deleteLikeTicket")
	public String deleteLikeTicket(BasketDTO basketDTO, HttpServletRequest request) {
		log.info("MemberController deleteLikeTicket start..");
		System.out.println("MemberController deleteLikeTicket basketDTO.getBasket_ref_id() ->" + basketDTO.getBasket_ref_id());
		HttpSession session = request.getSession();
		
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "member/loginForm";
		}
		
		// session에 로그인 된 아이디 정보
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String sessionId = member.getMem_id();
		
		basketDTO.setMem_id(sessionId);
		
		int result = memberService.deleteLikeTicket(basketDTO);
		System.out.println("MemberController deleteLikeTicket result -> " + result);
		
		return "redirect:/member/myPageLikeTicket";
	}
	
	// 쿠폰함
	@RequestMapping(value = "/myPageCouponPackage")
	public String myPageCoupon(MemCouponDTO couponDTO, Model model, String currentPage, HttpServletRequest request) {
		log.info("MemberController myPageCoupon start..");
		HttpSession session = request.getSession();
		
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "member/loginForm";
		}
		// session에 로그인 된 아이디 정보
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String sessionId = member.getMem_id();
		
		couponDTO.setMem_id(sessionId);
		
		List<MemCouponDTO> memCouponList = memberService.myPageCoupon(couponDTO);
		int memCouponListSize = memCouponList.size();
		model.addAttribute("memCouponList", memCouponList);
		model.addAttribute("memCouponListSize", memCouponListSize);
		System.out.println("MemberController myPageCoupon memCouponListSize -> " + memCouponListSize);
		
		return "member/myPageCouponPackage";
	}
	
	// 자주 찾는 질문 페이지 이동
	@GetMapping(value = "/myPageFAQ")
	public String goMyPageFAQ() {
		return "member/myPageFAQ";
	}
	
	// My 상품평 (패키지) 페이지 이동
	@RequestMapping(value = "/myPageReviewPackage")
	public String myPageReviewPackage(ReviewDTO reviewDTO, Model model, String currentPage, HttpServletRequest request) {
		log.info("MemberController myPageReviewPackage start..");
		HttpSession session = request.getSession();
		
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "member/loginForm";
		}
		
		// session에 로그인 된 아이디 정보
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String sessionId = member.getMem_id();
		
		
		
		System.out.println("MemberController myPageReviewPackage sessionId -> " + sessionId);
		System.out.println("MemberController myPageReviewPackage reviewDTO -> " + reviewDTO.getMem_id());
		System.out.println("MemberController myPageReviewPackage reviewDTO -> " + reviewDTO.getPk());
		
		// 페이징
		reviewDTO.setMem_id(sessionId);
		int total = memberService.totalReviewPackage(reviewDTO);
		System.out.println("MemberController myPageReviewPackage total -> " + total);
		PagingManager page = new PagingManager(total, currentPage);
		reviewDTO.setStart(page.getStart());
		reviewDTO.setEnd(page.getEnd());
		System.out.println("MemberController myPageReviewPackage page.getStart() -> " + page.getStart());
		System.out.println("MemberController myPageReviewPackage page.getEnd() -> " + page.getEnd());
		
		// 패키지 리뷰 목록
		List<ReviewDTO> packageReviewList = memberService.myPageReviewPackage(reviewDTO);
		int packageReviewListSize = packageReviewList.size();
		
		model.addAttribute("packageReviewList", packageReviewList);
		model.addAttribute("packageReviewListSize", packageReviewListSize);
		model.addAttribute("page", page);
		System.out.println("MemberController packgeReviewList.size() -> " + packageReviewList.size());
		
		return "member/myPageReviewPackage";
	}
	
	// My 상품평 (호텔) 페이지 이동
	@RequestMapping(value = "/myPageReviewHotel")
	public String myPageReviewHotel(ReviewDTO reviewDTO, Model model, String currentPage, HttpServletRequest request) {
		log.info("MemberController myPageReviewHotel start..");
		HttpSession session = request.getSession();
		
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "member/loginForm";
		}
		
		// session에 로그인 된 아이디 정보
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String sessionId = member.getMem_id();
		System.out.println("MemberController myPageReviewHotel sessionId -> " + sessionId);
		
		// 페이징 나중에
		reviewDTO.setMem_id(sessionId);
		int total = memberService.totalReviewHotel(reviewDTO);
		System.out.println("MemberController myPageReviewHotel total -> " + total);
		PagingManager page = new PagingManager(total, currentPage);
		reviewDTO.setStart(page.getStart());
		reviewDTO.setEnd(page.getEnd());
		System.out.println("MemberController myPageReviewHotel page.getStart() -> " + page.getStart());
		System.out.println("MemberController myPageReviewHotel page.getEnd() -> " + page.getEnd());
		
		// 호텔 리뷰 목록
		List<ReviewDTO> hotelReviewList = memberService.myPageReviewHotel(reviewDTO);
		int hotelReviewListSize = hotelReviewList.size();
		model.addAttribute("hotelReviewList", hotelReviewList);
		model.addAttribute("hotelReviewListSize", hotelReviewListSize);
		model.addAttribute("page", page);
		System.out.println("MemberController hotelReviewList.size() -> " + hotelReviewList.size());
		
		return "member/myPageReviewHotel";
	}
	
	// My 상품평 (티켓) 페이지 이동
	@RequestMapping(value = "/myPageReviewTicket")
	public String goMyPageReviewTicket(ReviewDTO reviewDTO, Model model, String currentPage, HttpServletRequest request) {
		log.info("MemberController goMyPageReviewTicket start..");
		HttpSession session = request.getSession();
		
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "member/loginForm";
		}
		
		// session에 로그인 된 아이디 정보
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String sessionId = member.getMem_id();
		System.out.println("MemberController goMyPageReviewTicket sessionId -> " + sessionId);
		
		// 페이징 나중에
		reviewDTO.setMem_id(sessionId);
		int total = memberService.totalReviewTicket(reviewDTO);
		System.out.println("MemberController totalReviewTicket total -> " + total);
		PagingManager page = new PagingManager(total, currentPage);
		reviewDTO.setStart(page.getStart());
		reviewDTO.setEnd(page.getEnd());
		System.out.println("MemberController totalReviewTicket page.getStart() -> " + page.getStart());
		System.out.println("MemberController totalReviewTicket page.getEnd() -> " + page.getEnd());
		
		// 티켓 리뷰 목록
		List<ReviewDTO> ticketReviewList = memberService.myPageReviewTicket(reviewDTO);
		int ticketReviewListSize = ticketReviewList.size();
		model.addAttribute("ticketReviewList", ticketReviewList);
		model.addAttribute("ticketReviewListSize", ticketReviewListSize);
		model.addAttribute("page", page);
		System.out.println("MemberController ticketReviewList.size() -> " + ticketReviewList.size());
		
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
	public String updateMember(MemberDTO memberDTO, HttpServletRequest request, HttpSession session) {
		log.info("MemberController updateMember start..");
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "member/loginForm";
		}
		// HttpSession session = request.getSession();
		
		memberService.updateMember(memberDTO);
		
		return "redirect:/member/myPagePrivacy";
	}
	
	// 비밀번호 변경 페이지1 이동
	@GetMapping(value = "/modifyPassword")
	public String goModifyPassword() {
		return "member/modifyPassword";
	}
	
	// 비밀번호 확인
	@PostMapping(value = "/checkPassword")
	public String checkPassword(MemberDTO memberDTO, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		log.info("MemberController checkPassword start..");
		
		// 로그인 정보 가져오기
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "member/loginForm";
		}
		// session에 저장된 로그인된 아이디의 비밀번호
		String sessionPw = member.getMem_password();
		System.out.println("MemberController checkPassword sessionPw -> "  + sessionPw);
		
		// 비밀번호 확인을 위해 새로 입력한 비밀번호
		String ckPw = memberDTO.getMem_password();
		System.out.println("MemberController checkPassword ckPw -> " + ckPw);
	
		if(!(sessionPw.equals(ckPw))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/modifyPassword";
		} else {
			System.out.println("MemberController checkPassword after..");
			return "redirect:/member/modifyPassword2";
		}
	}
	
	// 비밀번호 변경
	@PostMapping(value = "/updatePassword")
	public String updatePassword(MemberDTO memberDTO, HttpServletRequest request, HttpSession session) {
		log.info("MemberController updatePassword start..");
		
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "member/loginForm";
		}
		
		memberService.updatePassword(memberDTO);
		
		return "redirect:/member/myPageReservPackage";
	}
	
	
	// 비밀번호 변경 페이지2 이동
	@GetMapping(value = "/modifyPassword2")
	public String goModifyPassword2() {
		return "member/modifyPassword2";
	}
	
	
	
	// 회원 탈퇴 페이지 이동
	@GetMapping(value = "/deleteMember")
	public String goDeleteMember(HttpSession session) {
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "member/loginForm";
		}
		return "member/deleteMember";
	}
	
	// 회원 탈퇴
	@PostMapping(value = "/deleteMember")
	public String deleteMemeber(MemberDTO memberDTO, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		log.info("MemberController deleteMemeber Start..");
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "member/loginForm";
		}
		
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
