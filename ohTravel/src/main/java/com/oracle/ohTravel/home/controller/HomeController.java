package com.oracle.ohTravel.home.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.hotel.service.HotelService;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.pkage.service.PkageService;
import com.oracle.ohTravel.ticket.model.TicketDTO;
import com.oracle.ohTravel.ticket.service.TicketService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
	@Autowired
	PkageService pkageService;
	
	@Autowired
	TicketService ts;
	
	@Autowired
	HotelService hs;

	@GetMapping(value = "/")
	public String goHome(Model model, TicketDTO ticketDTO, HotelDTO hotelDTO) {
		try {
			// 해외 패키지 3개
			// 해외 패키지 상품 판매순 / 평점순 3개 가져오기
			Map<String, Integer> map = new HashMap<>();
			map.put("pkage_gubun", 1);
			map.put("row_count", 3);
			List<PkageDTO> abroadPkageList = pkageService.selectPkgBySoldScoreOrder(map);
			
			// 국내 패키지 3개
			Map<String, Integer> map2 = new HashMap<>();
			map2.put("pkage_gubun", 0);
			map2.put("row_count", 3);
			List<PkageDTO> domesticPkageList = pkageService.selectPkgBySoldScoreOrder(map2);
			
			// 호텔 3개
			List<HotelDTO> hotelList = hs.hotelList(hotelDTO);
			
			// 입장권 3개
			List<TicketDTO> ticketList = ts.ticketList(ticketDTO);
			
			
			model.addAttribute("abroadPkageList", abroadPkageList);
			model.addAttribute("domesticPkageList", domesticPkageList);
			model.addAttribute("abroadGubun", 1);
			model.addAttribute("domesticGubun", 0);
			model.addAttribute("ticketList", ticketList);
			model.addAttribute("hotelList" ,hotelList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "main/home";
	}
	
	@GetMapping(value = "/element")
	public String goElement() {
		return "ref/element";
	}
	
	@GetMapping(value = "/blog")
	public String goBlog() {
		return "ref/blog";
	}
	
	@GetMapping(value = "/justTest")
	public String goTest() {
		return "hotel/justTest";
	}
	
	@GetMapping(value = "/cssTest")
	public String goCssTest() {
		return "hotel/cssTest";
	}
	
	@GetMapping(value = "/tilesTest")
	public String goTilesTest() {
		return "empty/tilesTest";
	}
	
	
	
	/* =============== 입장권 =============== */
	@GetMapping(value = "ticketmain")
	public String goTicket() {
		return "ticket/ticketMain";
	}
	
	// 국내 입장권
	@GetMapping(value = "ticketDomestic")
	public String goTicketDomestic() {
		return "ticket/ticketDomestic";
	}
	// 해외 입장권
	@GetMapping(value = "ticketOverseas")
	public String goTicketOverseas() {
		return "ticket/ticketOverseas";
	}
}
