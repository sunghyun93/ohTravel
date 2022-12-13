package com.oracle.ohTravel.hotel.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.hotel.model.RoomDTO;
import com.oracle.ohTravel.hotel.service.HotelService;
import com.oracle.ohTravel.member.model.MemberDTO;
import com.oracle.ohTravel.member.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/hotel")
@RequiredArgsConstructor
@Slf4j
public class HotelController {

	
	private final HotelService hs;
	private final MemberService ms;
	
	// [숙박] 카테고리 선택 시의 화면
	@GetMapping(value = "/hotelmain")
	public String goHotel() {
		return "hotel/hotelMain";
	}
	
	
	//호텔 전체 List 조회
	@GetMapping(value = "/hotelHome")
	public String goHotelHome(HotelDTO hoteldto, Model model) {
		
		List<HotelDTO> hotelList = hs.hotelList(hoteldto);
		model.addAttribute("hotelList", hotelList);
		
		return "hotel/hotelHome";
	}
	
	//호텔 목록에서 호텔 하나를 선택했을때 나올 페이지 (단건 조회)
	@GetMapping(value = "/hotelDetail")
	public String goHotelDetail(HotelDTO hotelDTO, Model model) {
		hotelDTO = hs.getHotelDetail(hotelDTO);
		model.addAttribute("hotelDetail", hotelDTO);
		model.addAttribute("rv_real_id", hotelDTO.getHotel_id());
		return "hotel/hotelDetail";
	}
	
	
	@PostMapping(value="/hotelReservation")
	public String getRoomDetail(RoomDTO roomDTO, Model model, HttpServletRequest request, HttpSession session){
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		log.info("memberDTO = " + memberDTO);
		
		if(memberDTO == null) {
			return "redirect:/member/loginForm";
		}

		String mem_id = memberDTO.getMem_id();
		
		model.addAttribute("startDate", roomDTO.getStartDate());
		model.addAttribute("endDate", roomDTO.getEndDate());
		model.addAttribute("calDate", roomDTO.getCalDate());
		model.addAttribute("numberOfChild", roomDTO.getNumberOfChild());
		model.addAttribute("numberOfAdult", roomDTO.getNumberOfAdult());
		model.addAttribute("room_id", roomDTO.getRoom_id());
		model.addAttribute("roomDetail", hs.getRoomDetail(roomDTO));
		model.addAttribute("membership", hs.getMembershipInfo(mem_id));
		
		return "hotel/hotelPayment";
	}
	
	
}
