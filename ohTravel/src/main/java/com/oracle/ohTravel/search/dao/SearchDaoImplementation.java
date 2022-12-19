package com.oracle.ohTravel.search.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.basket.model.BasketDTO;
import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.search.model.CategoryDTOVO;
import com.oracle.ohTravel.search.model.RecentSearchDTO;
import com.oracle.ohTravel.search.model.SearchDTO;
import com.oracle.ohTravel.ticket.model.TicketDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class SearchDaoImplementation implements SearchDao {

	private final SqlSession sqs;

	// 패키지 목록 가져와
	@Override
	public List<PkageDTO> getPkageList(PkageDTO pkageDTO) {
		System.out.println("Dao getPkageList Start...");
		List<PkageDTO> pkageList = null;
		try {
			pkageList = sqs.selectList("yqPkageList", pkageDTO);
		} catch (Exception e) {
			System.out.println("Dao getPkageList Exception -> " + e.getMessage());
		}
		System.out.println("pkageDTO.getChk() -> " + pkageDTO.getChk());
		System.out.println("start -> " + pkageDTO.getStart());
		System.out.println("end -> " + pkageDTO.getEnd());
		return pkageList;
	}
	
	// 호텔 목록 가져와
	@Override
	public List<HotelDTO> getHotelList(HotelDTO hotelDTO) {
		System.out.println("Dao getHotelList Start...");
		List<HotelDTO> hotelList = null;
		try {
			hotelList = sqs.selectList("yqHotelList", hotelDTO);
		} catch (Exception e) {
			System.out.println("Dao getHotelList Exception -> " + e.getMessage());
		}
		return hotelList;
	}
		
	// 티켓 목록 가져와
	@Override
	public List<TicketDTO> getTicketList(TicketDTO ticketDTO) {
		System.out.println("Dao getTicketList Start...");
		List<TicketDTO> ticketList = null;
		try {
			ticketList = sqs.selectList("yqTicketList", ticketDTO);
		} catch (Exception e) {
			System.out.println("Dao getTicketList Exception -> " + e.getMessage());
		}
		return ticketList;
	}

	@Override
	public List<PkageDTO> filteredPkageList(HashMap<String, Object> pkageHM) {
		System.out.println("Dao filteredPkageList Start...");
		List<PkageDTO> filteredPkageList = null;
		try {
			filteredPkageList = sqs.selectList("yqFilteredPkageList", pkageHM);
		} catch (Exception e) {
			System.out.println("Dao filteredPkageList Exception -> " + e.getMessage());
		}
		return filteredPkageList;
	}

	@Override
	public List<HotelDTO> filteredHotelList(HashMap<String, Object> hotelHM) {
		System.out.println("Dao filteredHotelList Start...");
		List<HotelDTO> filteredHotelList = null;
		try {
			filteredHotelList = sqs.selectList("yqFilteredHotelList", hotelHM);
		} catch (Exception e) {
			System.out.println("Dao filteredHotelList Exception -> " + e.getMessage());
		}
		return filteredHotelList;
	}

	// insert가 되면 1을 리턴, 이미 담겨져 있다면 0을 리턴
	@Override
	public int insertLike(CategoryDTOVO categoryDTOVO) {
		System.out.println("Dao insertLike Start...");
		int insertFavorite = 0;
		System.out.println("Dao mem_id -> " + categoryDTOVO.getMem_id());
		try {
			insertFavorite = sqs.insert("yqInsertLike", categoryDTOVO);
		} catch (Exception e) {
			System.out.println("Dao insertLike Exception -> " + e.getMessage());
		}
		System.out.println("insertLike -> " + insertFavorite);
		return insertFavorite;
	}

	// 찜이 있으면 1을 리턴 , 없으면 0을 리턴
	@Override
	public int selectLike(CategoryDTOVO categoryDTOVO) {
		System.out.println("Dao selectLike Start...");
		int checkLike = 0;
		try {
			checkLike = sqs.selectOne("yqSelectLike", categoryDTOVO);
		} catch (Exception e) {
			System.out.println("Dao selectLike Exception -> " + e.getMessage());
		}
		System.out.println("checkLike -> " + checkLike);
		return checkLike;
	}

	@Override
	public int removeLike(CategoryDTOVO categoryDTOVO) {
		System.out.println("Dao removeLike Start...");
		int removeLike = 0;
		try {
			System.out.println("basket_ref_id -> " + categoryDTOVO.getBasket_ref_id());
			removeLike = sqs.delete("yqRemoveLike", categoryDTOVO);
		} catch (Exception e) {
			System.out.println("Dao removeLike Exception -> " + e.getMessage());
		}
		System.out.println("removeLike -> " + removeLike);
		return removeLike;
	}

	@Override
	public List<BasketDTO> callLike(BasketDTO basketDTO) {
		System.out.println("Dao callLike Start...");
		List<BasketDTO> callLikeList = null;
		try {
			callLikeList = sqs.selectList("yqCallLike", basketDTO);
		} catch (Exception e) {
			System.out.println("Dao callLike Exception -> " + e.getMessage());
		}
		System.out.println("callLikeList -> " + callLikeList);
		return callLikeList;
	}

	@Override
	public List<SearchDTO> popSearchWord(SearchDTO searchDTO) {
		System.out.println("Dao popSearchWord Start...");
		List<SearchDTO> searchWordList = null;
		try {
			searchWordList = sqs.selectList("yqSearchWord", searchDTO);
		} catch (Exception e) {
			System.out.println("Dao popSearchWord Exception -> " + e.getMessage());
		}
		System.out.println("popSearchWord -> " + searchWordList);
		return searchWordList;
	}

	@Override
	public int insertNewSearchWord(SearchDTO searchDTO) {
		System.out.println("Dao insertNewSearchWord Start...");
		int newSearchWord = 0;
		try {
			newSearchWord = sqs.insert("yqInsertNewSWord", searchDTO);
		} catch (Exception e) {
			System.out.println("Dao insertNewSearchWord Exception -> " + e.getMessage());
		}
		System.out.println("newSearchWord -> " + newSearchWord);
		return newSearchWord;
	}

	@Override
	public int updateSearchCount(SearchDTO searchDTO) {
		System.out.println("Dao updateSearchCount Start...");
		int searchCountUp = 0;
		try {
			searchCountUp = sqs.update("yqUpdateSCount", searchDTO);
		} catch (Exception e) {
			System.out.println("Dao updateSearchCount Exception -> " + e.getMessage());
		}
		System.out.println("popSearchWord -> " + searchCountUp);
		return searchCountUp;
	}

	@Override
	public List<Map<String, Object>> autoComplete(Map<String, Object> paramMap) {
		System.out.println("Dao autoComplete Start...");
		List<Map<String, Object>> autoCompleteList = null;
		try {
			autoCompleteList = sqs.selectList("yqAutoComplete", paramMap);
		} catch (Exception e) {
			System.out.println("Dao autoComplete Exception -> " + e.getMessage());
		}
		System.out.println("autoCompleteList -> " + autoCompleteList);
		return autoCompleteList;
	}

	@Override
	public int insertMemSearchWord(RecentSearchDTO recentSearchDTO) {
		System.out.println("Dao insertMemSearchWord Start...");
		int insertResult = 0;
		try {
			insertResult = sqs.insert("yqRecentSearchInsert", recentSearchDTO);
		} catch (Exception e) {
			System.out.println("Dao insertMemSearchWord Exception -> " + e.getMessage());
		}
		System.out.println("insertResult -> " + insertResult);
		return insertResult;
	}

	@Override
	public int updateSysdate(RecentSearchDTO recentSearchDTO) {
		System.out.println("Dao updateSysdate Start...");
		int updateResult = 0;
		try {
			updateResult = sqs.update("yqUpdateRecentSysdate", recentSearchDTO);
		} catch (Exception e) {
			System.out.println("Dao updateSysdate Exception -> " + e.getMessage());
		}
		System.out.println("updateResult -> " + updateResult);
		return updateResult;
	}

	@Override
	public List<RecentSearchDTO> recentSearch(RecentSearchDTO recentSearchDTO) {
		System.out.println("Dao recentSearch Start...");
		List<RecentSearchDTO> memRecentSearch = null;
		try {
			memRecentSearch = sqs.selectList("yqRecentSearchSelect", recentSearchDTO);
		} catch (Exception e) {
			System.out.println("Dao recentSearch Exception -> " + e.getMessage());
		}
		System.out.println("updateResult -> " + memRecentSearch);
		return memRecentSearch;
	}

	@Override
	public List<RecentSearchDTO> normalRecentSearch() {
		System.out.println("Dao normalRecentSearch Start...");
		List<RecentSearchDTO> normalSearch = null;
		try {
			normalSearch = sqs.selectList("yqNormalRecentSearch");
		} catch (Exception e) {
			System.out.println("Dao normalRecentSearch Exception -> " + e.getMessage());
		}
		System.out.println("normalSearch -> " + normalSearch);
		return normalSearch;
	}

	@Override
	public List<BasketDTO> checkLike(BasketDTO basketDTO) {
		System.out.println("Dao checkLike Start...");
		List<BasketDTO> checkLike = null;
		try {
			System.out.println("DAO " + basketDTO.getMem_id());
			checkLike = sqs.selectList("yqCheckLike", basketDTO);
		} catch (Exception e) {
			System.out.println("Dao checkLike Exception -> " + e.getMessage());
		}
		return checkLike;
	}
	
}
