package com.oracle.ohTravel.search.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.oracle.ohTravel.basket.model.BasketDTO;
import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.search.model.CategoryDTOVO;
import com.oracle.ohTravel.search.model.RecentSearchDTO;
import com.oracle.ohTravel.search.model.SearchDTO;
import com.oracle.ohTravel.ticket.model.TicketDTO;

public interface SearchService {

//	List<TicketModel> getTicketList(String search_word);

	List<PkageDTO> getPkageList(PkageDTO pkageDTO);

	List<HotelDTO> getHotelList(HotelDTO hotelDTO);

	List<TicketDTO> getTicketList(TicketDTO ticketDTO);

	List<PkageDTO> filteredPkageList(HashMap<String, Object> pkageHM);

	List<HotelDTO> filteredHotelList(HashMap<String, Object> hotelHM);

	int insertLike(CategoryDTOVO categoryDTOVO);

	int selectLike(CategoryDTOVO categoryDTOVO);

	int removeLike(CategoryDTOVO categoryDTOVO);

	List<BasketDTO> callLikeList(BasketDTO basketDTO);

	List<SearchDTO> searchWordList(SearchDTO searchDTO);

	int insertNewSearchWord(SearchDTO search_word);

	int updateSearchCount(SearchDTO search_word);

	List<Map<String, Object>> autoComplete(Map<String, Object> paramMap);

	int InsertMemSearchWord(RecentSearchDTO recentSearchDTO);

	int updateSysdate(RecentSearchDTO recentSearchDTO);

	List<RecentSearchDTO> recentSearch(RecentSearchDTO recentSearchDTO);

	List<RecentSearchDTO> normalRecentSearch();

	List<BasketDTO> checkLike(BasketDTO basketDTO);

}
