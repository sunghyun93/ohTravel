package com.oracle.ohTravel.search.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.oracle.ohTravel.basket.model.BasketDTO;
import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.search.dao.SearchDao;
import com.oracle.ohTravel.search.model.CategoryDTOVO;
import com.oracle.ohTravel.search.model.RecentSearchDTO;
import com.oracle.ohTravel.search.model.SearchDTO;
import com.oracle.ohTravel.ticket.model.TicketDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SearchServiceImplementation implements SearchService {
	
	private final SearchDao sd;
	
	@Override
	public List<PkageDTO> getPkageList(PkageDTO pkageDTO) {
		System.out.println("Service getPkageList Start...");
		List<PkageDTO> pkageList = sd.getPkageList(pkageDTO);
		return pkageList;
	}

	@Override
	public List<HotelDTO> getHotelList(HotelDTO hotelDTO) {
		System.out.println("Service getHotelList Start...");
		List<HotelDTO> hotelList = sd.getHotelList(hotelDTO);
		return hotelList;
	}

	@Override
	public List<TicketDTO> getTicketList(TicketDTO ticketDTO) {
		System.out.println("Service getTicketList Start...");
		List<TicketDTO> ticketList = sd.getTicketList(ticketDTO);
		return ticketList;
	}

	@Override
	public List<PkageDTO> filteredPkageList(HashMap<String, Object> hm) {
		List<PkageDTO> filteredPkageList = sd.filteredPkageList(hm);
		return filteredPkageList;
	}

	@Override
	public List<HotelDTO> filteredHotelList(HashMap<String, Object> hotelHM) {
		List<HotelDTO> filteredHotelList = sd.filteredHotelList(hotelHM);
		return filteredHotelList;
	}

	@Override
	public int selectLike(CategoryDTOVO categoryDTOVO) {
		int checkLike = sd.selectLike(categoryDTOVO);
		return checkLike;
	}

	@Override
	public int insertLike(CategoryDTOVO categoryDTOVO) {
		int result = sd.insertLike(categoryDTOVO);
		return result;
	}


	@Override
	public int removeLike(CategoryDTOVO categoryDTOVO) {
		int removeLike = sd.removeLike(categoryDTOVO);
		return removeLike;
	}

	@Override
	public List<BasketDTO> callLikeList(BasketDTO basketDTO) {
		List<BasketDTO> callLikeList = sd.callLike(basketDTO);
		return callLikeList;
	}

	@Override
	public List<SearchDTO> searchWordList(SearchDTO searchDTO) {
		List<SearchDTO> searchWordList = sd.popSearchWord(searchDTO);
		return searchWordList;
	}

	@Override
	public int insertNewSearchWord(SearchDTO searchDTO) {
		int newSearchWord = sd.insertNewSearchWord(searchDTO);
		return newSearchWord;
	}

	@Override
	public int updateSearchCount(SearchDTO searchDTO) {
		int searchCountUp = sd.updateSearchCount(searchDTO);
		return searchCountUp;
	}

	@Override
	public List<Map<String, Object>> autoComplete(Map<String, Object> paramMap) {
		List<Map<String, Object>> autoCompleteList = sd.autoComplete(paramMap);
		return autoCompleteList;
	}

	@Override
	public int InsertMemSearchWord(RecentSearchDTO recentSearchDTO) {
		int insertMemSearch = sd.insertMemSearchWord(recentSearchDTO);
		return insertMemSearch;
	}

	@Override
	public int updateSysdate(RecentSearchDTO recentSearchDTO) {
		int updateSysdate = sd.updateSysdate(recentSearchDTO);
		return updateSysdate;
	}

	@Override
	public List<RecentSearchDTO> recentSearch(RecentSearchDTO recentSearchDTO) {
		List<RecentSearchDTO> memRecentSearch = sd.recentSearch(recentSearchDTO);
		return memRecentSearch;
	}

	@Override
	public List<RecentSearchDTO> normalRecentSearch() {
		List<RecentSearchDTO> normalSearch = sd.normalRecentSearch();
		return normalSearch;
	}

	@Override
	public List<BasketDTO> checkLike(BasketDTO basketDTO) {
		List<BasketDTO> checkLike = sd.checkLike(basketDTO);
		return checkLike;
	}

	
}
