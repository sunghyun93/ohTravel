package com.oracle.ohTravel.search.dao;

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

public interface SearchDao {

	List<PkageDTO> getPkageList(PkageDTO pkageDTO);

	List<HotelDTO> getHotelList(HotelDTO hotelDTO);

	List<TicketDTO> getTicketList(TicketDTO ticketDTO);

	List<PkageDTO> filteredPkageList(HashMap<String, Object> hm);

	List<HotelDTO> filteredHotelList(HashMap<String, Object> hotelHM);

	List<BasketDTO> callLike(BasketDTO basketDTO);

	List<SearchDTO> popSearchWord(SearchDTO searchDTO);

	int selectLike(CategoryDTOVO categoryDTOVO);

	int insertLike(CategoryDTOVO categoryDTOVO);

	int removeLike(CategoryDTOVO categoryDTOVO);

	int insertNewSearchWord(SearchDTO searchDTO);

	int updateSearchCount(SearchDTO searchDTO);

	List<Map<String, Object>> autoComplete(Map<String, Object> paramMap);

	int insertMemSearchWord(RecentSearchDTO recentSearchDTO);

	int updateSysdate(RecentSearchDTO recentSearchDTO);

	List<RecentSearchDTO> recentSearch(RecentSearchDTO recentSearchDTO);

	List<RecentSearchDTO> normalRecentSearch();

	List<BasketDTO> checkLike(BasketDTO basketDTO);

	List<TicketDTO> filteredTicketList(HashMap<String, Object> ticketHM);

	
}
