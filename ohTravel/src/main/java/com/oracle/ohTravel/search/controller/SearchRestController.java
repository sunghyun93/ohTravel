package com.oracle.ohTravel.search.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.ohTravel.basket.model.BasketDTO;
import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.search.model.CategoryDTOVO;
import com.oracle.ohTravel.search.service.RowPriceComparator;
import com.oracle.ohTravel.search.service.OrderComparator;
import com.oracle.ohTravel.search.service.HighPriceComparator;
import com.oracle.ohTravel.search.service.ScoreComparator;
import com.oracle.ohTravel.search.service.SearchService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class SearchRestController {
	
	private final SearchService ss;
	
	@GetMapping("/pkageFilter")
	public List<PkageDTO> pkageFilter(String existChkBox, @RequestParam(value = "check") List<String> check, @RequestParam(value = "radioCheck1") String radioCheck,  PkageDTO pkageDTO, String currentPage) {
		System.out.println("check -> " + check);
		System.out.println("radioCheck -> " + radioCheck);
		HashMap<String, Object> pkageHM = new HashMap<>();
		pkageHM.put("pkageDTO", pkageDTO) ;
		pkageHM.put("check", check) ;
		pkageHM.put("radioCheck", radioCheck) ;
		pkageHM.put("existChkBox", existChkBox);
		System.out.println(check);
		System.out.println("pkageDTO -> " + pkageDTO.getCheck());
		System.out.println("search_word -> " + pkageDTO.getSearch_word());
		System.out.println("currentPage -> " + currentPage);
		List<PkageDTO> pkList = ss.filteredPkageList(pkageHM);
		if("buy_order".equals(radioCheck)) {
			System.out.println("buy_order");
			Collections.sort(pkList, new OrderComparator());
		}
		if("high_score".equals(radioCheck)) {
			System.out.println("high_score");
			Collections.sort(pkList, new ScoreComparator());
		}
		if("high_price".equals(radioCheck)) {
			System.out.println("high_price");
			Collections.sort(pkList, new HighPriceComparator());
		}
		else if("row_price".equals(radioCheck)) {
			System.out.println("row_price");
			Collections.sort(pkList, new RowPriceComparator());
		}
		System.out.println("pkList="+pkList);
		System.out.println("필터된 리스트 수 -> " + pkList.size());
		return pkList;
	}
	
	@GetMapping("/hotelFilter")
	public List<HotelDTO> pkageFilter(@RequestParam(value = "check") List<String> check, HotelDTO hotelDTO, String currentPage) {
		System.out.println("check -> " + check);
		HashMap<String, Object> hotelHM = new HashMap<String, Object>();
		hotelHM.put("hotelDTO", hotelDTO);
		hotelHM.put("check", check);
		System.out.println("search_word -> " + hotelDTO.getSearch_word());
		System.out.println("currentPage -> " + currentPage);
		List<HotelDTO> htList = ss.filteredHotelList(hotelHM);
		System.out.println("필터된 리스트 수 -> " + htList.size());
		return htList;
	}
	
	@GetMapping("/packageFilterReset")
	public List<PkageDTO> packageFilterReset(PkageDTO pkageDTO, String currentPage) {
		System.out.println("packageFilterReset Controller");
		List<PkageDTO> pkageResetList = ss.getPkageList(pkageDTO);
		System.out.println("필터된 리스트 수 -> " + pkageResetList.size());
		return  pkageResetList;
	}
	
	@GetMapping("/hotelFilterReset")
	public List<HotelDTO> hotelFilterReset(HotelDTO hotelDTO, String currentPage) {
		System.out.println("hotelFilterReset Controller");
		List<HotelDTO> hotelResetList = ss.getHotelList(hotelDTO);
		System.out.println("필터된 리스트 수 -> " + hotelResetList.size());
		return  hotelResetList;
	}
	
	// 찜 돼있는 항목들 불러오기
	@GetMapping("/callLike")
	public List<BasketDTO> callLikeList(BasketDTO basketDTO, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("sessionId");
		if (mem_id != null) {
			List<BasketDTO> callLikeList = ss.callLikeList(basketDTO);
			System.out.println("필터된 리스트 수 -> " + callLikeList.size());
			return callLikeList;
		}
		return null;
	}
	
	// 찜 등록
	@GetMapping("/insertLike")
	public int insertLike(CategoryDTOVO categoryDTOVO, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("insertLike Controller");
		int result = 0;
		int checkLike = 0;
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("sessionId");
		categoryDTOVO.setMem_id(mem_id);
		System.out.println("categoryDTOVO.getMem_id() -> " + categoryDTOVO.getMem_id());
		if (mem_id == null) {
			System.out.println("로그인 하고 와");
			return -1;
		}
		try {
			System.out.println("찜 돼있나 확인");
			checkLike = ss.selectLike(categoryDTOVO);
			if (checkLike == 0)
				System.out.println("찜 insert 실행");
				result = ss.insertLike(categoryDTOVO);
				System.out.println("insert 결과 -> " + result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	// 찜 해제
	@GetMapping("/removeLike")
	public int removeLike(CategoryDTOVO categoryDTOVO, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("insertLike Controller");
		int result = 0;
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("sessionId");
		categoryDTOVO.setMem_id(mem_id);
		System.out.println("categoryDTOVO.getMem_id() -> " + categoryDTOVO.getMem_id());
		if (mem_id == null) {
			System.out.println("로그인 하고 와");
			return -1;
		}
		try {
			System.out.println("찜 remove 실행");
			result = ss.removeLike(categoryDTOVO);
			System.out.println("remove 결과 -> " + result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
}


