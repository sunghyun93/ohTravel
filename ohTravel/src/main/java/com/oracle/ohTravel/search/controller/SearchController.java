package com.oracle.ohTravel.search.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.ohTravel.basket.model.BasketDTO;
import com.oracle.ohTravel.city.model.CityDTO;
import com.oracle.ohTravel.country.model.CountryDTO;
import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.search.model.CategoryDTOVO;
import com.oracle.ohTravel.search.model.RecentSearchDTO;
import com.oracle.ohTravel.search.model.SearchDTO;
import com.oracle.ohTravel.search.service.Paging;
import com.oracle.ohTravel.search.service.SearchService;
import com.oracle.ohTravel.ticket.model.TicketDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SearchController {
	
	private final SearchService ss;
	
	@GetMapping("/search/searchResult")
	public String searchResult(BasketDTO basketDTO, RecentSearchDTO recentSearchDTO, PkageDTO pkageDTO, HotelDTO hotelDTO, TicketDTO ticketDTO, SearchDTO searchDTO, Model model, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Controller SearchResultPage Start...");
		model.addAttribute("search_word", pkageDTO.getSearch_word());
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("sessionId");
		recentSearchDTO.setMem_id(mem_id);
		basketDTO.setMem_id(mem_id);
		pkageDTO.setMem_id(mem_id);
		hotelDTO.setMem_id(mem_id);
		ticketDTO.setMem_id(mem_id);
		System.out.println("basketDTO.getMem_id() -> " + basketDTO.getMem_id());
		
		// 찜한 상태 불러오기
		if (mem_id != null) {
			List<BasketDTO> checkLike = ss.checkLike(basketDTO);
			System.out.println("checkLike -> " + checkLike);
			model.addAttribute("checkLike",  checkLike);
		}
		
		// 멤버 최근 검색어 등록
		if (mem_id != null) {
			int memSearchWord = ss.InsertMemSearchWord(recentSearchDTO);
			System.out.println("memSearchWord -> " + memSearchWord);
			int updateResult = ss.updateSysdate(recentSearchDTO);
			System.out.println("updateResult -> " + updateResult);

			// 신규 검색어 등록
			int newSearchWord = ss.insertNewSearchWord(searchDTO);
			System.out.println("newSearchWord -> " + newSearchWord);
			
			// 검색한 검색어 search_count up
			int searchCountUp = ss.updateSearchCount(searchDTO);
			System.out.println("searchCountUp -> " + searchCountUp);
		} else {
			System.out.println("not 회원이에용");
			// 검색어 리스트 조회
			List<SearchDTO> selectSearchList = ss.searchWordList(searchDTO);
			System.out.println("selectSearchList -> " + selectSearchList);
			
			// 신규 검색어 등록
			int newSearchWord = ss.insertNewSearchWord(searchDTO);
			System.out.println("newSearchWord -> " + newSearchWord);
			
			// 검색한 검색어 search_count up
			int searchCountUp = ss.updateSearchCount(searchDTO);
			System.out.println("searchCountUp -> " + searchCountUp);
		}
		
		// 입장권 목록
		List<TicketDTO> ticketList = ss.getTicketList(ticketDTO);
		System.out.println("Controller ticketList -> " + ticketList);
		model.addAttribute("ticketList", ticketList);
		System.out.println("Controller ticketList.size() -> " + ticketList.size());
		model.addAttribute("ticketListCount", ticketList.size());

		// 호텔 목록
		List<HotelDTO> hotelList = ss.getHotelList(hotelDTO);
		System.out.println("Controller hotelList -> " + hotelList);
		model.addAttribute("hotelList", hotelList);
		System.out.println("Controller hotelList.size() -> " + hotelList.size());
		model.addAttribute("hotelListCount", hotelList.size());
		
		// 패키지 목록
		List<PkageDTO> pkageList = ss.getPkageList(pkageDTO);
		System.out.println("Controller pkageList -> " + pkageList);
		model.addAttribute("pkageList", pkageList);
		// 패키지 목록 개수
		System.out.println("Controller pkageList.size() -> " + pkageList.size());
		model.addAttribute("pkageListCount", pkageList.size());

		return "search/searchResultPage";
	}
	
	@GetMapping("/search/searchCategoryAjax")
	@ResponseBody
	public CategoryDTOVO searchCategoryAjax(CategoryDTOVO categoryDTOVO,  HttpServletRequest request, String gubun, HotelDTO hotelDTO, PkageDTO pkageDTO, TicketDTO ticketDTO, 
			 String currentPage, String search_word) {
		System.out.println("Controller searchPkageAjax");
		System.out.println(pkageDTO.getSearch_word()+", "+gubun);
		System.out.println("currentPage -> " + currentPage);
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("sessionId");
		pkageDTO.setMem_id(mem_id);
		hotelDTO.setMem_id(mem_id);
		ticketDTO.setMem_id(mem_id);
		categoryDTOVO.setMem_id(mem_id);

		if (gubun.equals("pkage")) {
			List<PkageDTO> pkageList = ss.getPkageList(pkageDTO);
			System.out.println("Controller pkageList -> " + pkageList);
			// Paging 작업
			int totalPkage = pkageList.size();
			System.out.println("totalPkage -> " + totalPkage);
			Paging page = new Paging(totalPkage, currentPage); // currentPage Paging 메소드 안에서 null값 체크해줌
			pkageDTO.setStart(page.getStart());
			pkageDTO.setEnd(page.getEnd());
			// 페이지 받아옴
			List<PkageDTO> pkageList2 = ss.getPkageList(pkageDTO);
			int totalPkage2 = pkageList2.size();
			System.out.println("totalPkage2 -> " + totalPkage2);
			System.out.println("pkageDTO.getStart() " + pkageDTO.getStart());
			System.out.println("pkageDTO.getEnd() " + pkageDTO.getEnd());
			CategoryDTOVO pkageDTOVO = new CategoryDTOVO();
			pkageDTOVO.setPkageList(pkageList2);
			pkageDTOVO.setPaging(page);
			pkageDTOVO.setSearch_word(search_word);
			pkageDTOVO.setTotalPkage(totalPkage2);
			return pkageDTOVO;
		} 
		
		if (gubun.equals("hotel")) {
			List<HotelDTO> hotelList = ss.getHotelList(hotelDTO);
			System.out.println("Controller hoteList -> " + hotelList);
			// Paging 작업
			int totalHotel = hotelList.size();
			Paging page = new Paging(totalHotel, currentPage); // currentPage Paging 메소드 안에서 null값 체크해줌
			hotelDTO.setStart(page.getStart());
			hotelDTO.setEnd(page.getEnd());
			// 페이지 받아옴
			List<HotelDTO> hotelList2 = ss.getHotelList(hotelDTO);
			int totalHotel2 = hotelList2.size();
			Paging page2 = new Paging(totalHotel2, currentPage); 
			System.out.println("totalHotel2 -> " + totalHotel2);
			System.out.println("page.getStart() " + hotelDTO.getStart());
			System.out.println("page.getEnd() " + hotelDTO.getEnd());
			System.out.println("page -> " + page2);
			CategoryDTOVO hotelDTOVO = new CategoryDTOVO();
			hotelDTOVO.setHotelList(hotelList2);
			hotelDTOVO.setPaging(page2);
			hotelDTOVO.setTotalHotel(totalHotel2);
			return hotelDTOVO;
		} 
		
		if(gubun.equals("ticket")) {
			List<TicketDTO> ticketList = ss.getTicketList(ticketDTO);
			System.out.println("Controller ticketList -> " + ticketList);
			// Paging 작업
			int totalTicket = ticketList.size();
			Paging page = new Paging(totalTicket, currentPage); // currentPage Paging 메소드 안에서 null값 체크해줌
			ticketDTO.setStart(page.getStart());
			ticketDTO.setEnd(page.getEnd());
			// 페이지 받아옴
			List<TicketDTO> ticketList2 = ss.getTicketList(ticketDTO);
			int totalTicket2 = ticketList2.size();
			Paging page2 = new Paging(totalTicket2, currentPage); 
			System.out.println("totalTicket2 -> " + totalTicket2);
			System.out.println("page.getStart() " + ticketDTO.getStart());
			System.out.println("page.getEnd() " + ticketDTO.getEnd());
			System.out.println("page -> " + page2);
			CategoryDTOVO ticketDTOVO = new CategoryDTOVO();
			ticketDTOVO.setTicketList(ticketList2);
			ticketDTOVO.setPaging(page2);
			ticketDTOVO.setTotalTicket(totalTicket2);
			return ticketDTOVO;
		} 
		
		else {
			System.out.println("Controller all");
			categoryDTOVO = new CategoryDTOVO();
			Paging page = new Paging(0, null);
			categoryDTOVO.setStart(page.getStart());
			categoryDTOVO.setEnd(page.getEnd());
			// 패키지 목록
			List<PkageDTO> pkageList = ss.getPkageList(pkageDTO);
			System.out.println("Controller pkageList -> " + pkageList);
			categoryDTOVO.setPkageList(pkageList);

			// 호텔 목록
			List<HotelDTO> hotelList = ss.getHotelList(hotelDTO);
			System.out.println("Controller hotelList -> " + hotelList);
			categoryDTOVO.setHotelList(hotelList);

			// 입장권 목록
			List<TicketDTO> ticketList = ss.getTicketList(ticketDTO);
			System.out.println("Controller ticketList -> " + ticketList);
			categoryDTOVO.setTicketList(ticketList);
			
			return categoryDTOVO;
		}
	}
	
	// 인기 검색어
	@GetMapping("/popSearchWord")
	@ResponseBody
	public List<SearchDTO> popSearchWord(SearchDTO searchDTO) {
		List<SearchDTO> popSearch = ss.searchWordList(searchDTO);
		return popSearch;
	}

	// 최근 검색어
	@GetMapping("/recentSearchWord")
	@ResponseBody
	public List<RecentSearchDTO> recentSearchWord(RecentSearchDTO recentSearchDTO, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Controller recentSearchWord");
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("sessionId");
		recentSearchDTO.setMem_id(mem_id);
		if (mem_id != null) {
			List<RecentSearchDTO> memRecentSearch = ss.recentSearch(recentSearchDTO);
			return memRecentSearch;
		} else {
			// 그냥 공용 최근 검색
//			List<RecentSearchDTO> normalSearch = ss.normalRecentSearch();
			return null;
		}
	}
	
	// 검색어 자동완성
	@PostMapping(value = "/autoComplete")
	public @ResponseBody Map<String, Object> autocomplete (@RequestParam Map<String, Object> paramMap, SearchDTO searchDTO, PkageDTO pkageDTO, HotelDTO hotelDTO, TicketDTO ticketDTO, CityDTO cityDTO, CountryDTO countryDTO) throws Exception{
		System.out.println("Controller autoComplete");
		paramMap.put("countryDTO", countryDTO);
		paramMap.put("cityDTO", cityDTO);
		paramMap.put("pkageDTO", pkageDTO);
		paramMap.put("hotelDTO", hotelDTO);
		paramMap.put("ticketDTO", ticketDTO);
		List<Map<String, Object>> resultList = ss.autoComplete(paramMap);
		paramMap.put("resultList", resultList);
		return paramMap;
	}
}
