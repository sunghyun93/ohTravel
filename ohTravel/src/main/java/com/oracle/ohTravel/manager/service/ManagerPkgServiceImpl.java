package com.oracle.ohTravel.manager.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.ohTravel.airport.model.Air_ScheduleDTORM;
import com.oracle.ohTravel.hotel.model.HotelDTORM;
import com.oracle.ohTravel.manager.dao.ManagerPkgDAO;
import com.oracle.ohTravel.pkage.dao.PkageDao;
import com.oracle.ohTravel.pkage.model.AttractionDTO;
import com.oracle.ohTravel.pkage.model.Pkage_detailDTO;
import com.oracle.ohTravel.pkage.model.Pkage_flightScheDTO;
import com.oracle.ohTravel.pkage.model.Pkage_hotelDTO;
import com.oracle.ohTravel.pkage.model.Pkage_sche_detailDTO;
import com.oracle.ohTravel.pkage.model.Pkage_schedulDTO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ManagerPkgServiceImpl implements ManagerPkgService {
	@Autowired
	private ManagerPkgDAO managerPkgDAO;
	@Autowired
	private PkageDao pkageDao;
	
// 패키지 상세 추가 insert 및 select 문들
	// 패키지 상세 추가
	@Override
	public int insertPackage1(Pkage_detailDTO pk) throws Exception {
		log.info("ManagerPkgServiceImpl insertPackage1() start...");
		int rowCnt = managerPkgDAO.insertPackage1(pk);
		log.info("ManagerPkgServiceImpl insertPackage1() end...");
		return rowCnt;
	}

	// 패키지 상세 추가 후 가장 최근의 pkage_dt_id 가져오기
	@Override
	public int selectRecentPkageDtId(String pkage_id) throws Exception {
		log.info("ManagerPkgServiceImpl selectRecentPkageDtId() start...");
		int pkage_dt_id = managerPkgDAO.selectRecentPkageDtId(pkage_id);
		log.info("ManagerPkgServiceImpl selectRecentPkageDtId() end...");
		return pkage_dt_id;
	}
	
	// 패키지 여행 일정 추가
	@Override
	public int insertPkgSche(Map<String, Object> map) throws Exception {
		log.info("ManagerPkgServiceImpl insertPkgSche() start...");
		
		// Pkage_schedulDTO List 만들기
		List<Pkage_schedulDTO> pkage_schedulDTOList = new ArrayList<>();
		
		Pkage_schedulDTO dto = (Pkage_schedulDTO)map.get("pkage_schedulDTO");
		
		for(int i = 0; i < dto.getPkage_dt_idList().size(); i++) {
			Pkage_schedulDTO pkage_schedulDTO = new Pkage_schedulDTO();
			pkage_schedulDTO.setPkage_dt_id(Integer.valueOf(dto.getPkage_dt_idList().get(i))); // 패키지상세ID, String -> Integer
			pkage_schedulDTO.setPkage_sche_day(Integer.valueOf(dto.getPkage_sche_dayList().get(i))); // 여행일차, String -> Integer
			pkage_schedulDTO.setPkage_sche_trans(dto.getPkage_sche_transList().get(i)); // 이동수단
			pkage_schedulDTO.setPkage_sche_b(dto.getPkage_sche_bList().get(i)); // 조식
			pkage_schedulDTO.setPkage_sche_l(dto.getPkage_sche_lList().get(i)); // 중식
			pkage_schedulDTO.setPkage_sche_d(dto.getPkage_sche_dList().get(i)); // 석식
			
			pkage_schedulDTOList.add(pkage_schedulDTO);
		}
		
		// map 에 리스트 실어서 보내기
		map.put("pkage_schedulDTOList", pkage_schedulDTOList);
		
		int rowCnt = managerPkgDAO.insertPkgSche(map);
		log.info("ManagerPkgServiceImpl insertPkgSche() end...");
		return rowCnt;
	}
	
	// pkage_detail 과 해당 패키지의 도시에 해당하는 관광지 가져오기
	@Override
	public List<AttractionDTO> selectAttrConnectedPkgDetail(String pkage_dt_id) throws Exception {
		log.info("ManagerPkgServiceImpl selectCityIdConnectedPkgDetail() start...");
		List<AttractionDTO> list = managerPkgDAO.selectAttrConnectedPkgDetail(pkage_dt_id);
		log.info("ManagerPkgServiceImpl selectCityIdConnectedPkgDetail() end...");
		return list;
	}
	
	// pkage_detail 과 해당하는 도시ID 가져오기
	@Override
	public int selectCityIdConnectedPkgDetail(Integer pkage_dt_id) throws Exception {
		log.info("ManagerPkgServiceImpl selectCityIdConnectedPkgDetail() start...");
		int city_id = managerPkgDAO.selectCityIdConnectedPkgDetail(pkage_dt_id);
		log.info("ManagerPkgServiceImpl selectCityIdConnectedPkgDetail() end");
		return city_id;
	}
	
	// 패키지 여행일정_관광지 추가
	@Override
	public int insertPkgScheDetail(Pkage_sche_detailDTO pkage_sche_detailDTO) throws Exception {
		log.info("ManagerPkgServiceImpl insertPkgScheDetail() start...");
		
		List<Pkage_sche_detailDTO> list = new ArrayList<>();
		
		for(int i = 0; i < pkage_sche_detailDTO.getPkage_dt_idL().size(); i++) {
			Pkage_sche_detailDTO dto = new Pkage_sche_detailDTO();
			dto.setPkage_dt_id(pkage_sche_detailDTO.getPkage_dt_idL().get(i));
			dto.setPkage_sche_day(pkage_sche_detailDTO.getPkage_sche_dayL().get(i));
			dto.setAttr_id(pkage_sche_detailDTO.getAttr_idL().get(i));
			dto.setPkage_s_d_order(pkage_sche_detailDTO.getPkage_s_d_orderL().get(i));
			
			list.add(dto);
		}
		
		Map<String,Object> map = new HashMap<>();
		map.put("pkage_sche_detailDTOList", list);
		
		int rowCnt = managerPkgDAO.insertPkgScheDetail(map);
		log.info("ManagerPkgServiceImpl insertPkgScheDetail() end...");
		return rowCnt;
	}
	
	// 패키지 상세 일정과 맞는 날짜의 비행일정 가져오기 (출발 시작/도착 시작은 모조건 인천)
	@Override
	public List<Air_ScheduleDTORM> selectAirScheConnectedPkgDetail(Map<String, Object> map) throws Exception {
		log.info("ManagerPkgServiceImpl selectAirScheConnectedPkgDetail() start...");
		List<Air_ScheduleDTORM> list = managerPkgDAO.selectAirScheConnectedPkgDetail(map);
		log.info("ManagerPkgServiceImpl selectAirScheConnectedPkgDetail() end...");
		return list;
	}
	
	// 패키지 비행일정 추가
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertPkgFlightSche(Pkage_flightScheDTO pkage_flightScheDTO) throws Exception {
		log.info("ManagerPkgServiceImpl insertPkgFlightSche() start...");
		Map<String, Object> map = new HashMap<>();
		
		List<Pkage_flightScheDTO> list = new ArrayList<>();
		
		for(int i = 0; i < 2; i++) {
			Pkage_flightScheDTO dto = new Pkage_flightScheDTO();
			dto.setPkage_dt_id(pkage_flightScheDTO.getPkage_dt_idL().get(i));
			dto.setPkage_flight_gubun(pkage_flightScheDTO.getPkage_gubunL().get(i));
			
			// 0 이면 시작, 1이면 종료
			if(dto.getPkage_flight_gubun() == 0) {
				dto.setSchedule_id(pkage_flightScheDTO.getStartSchedule_id());
			} else {
				dto.setSchedule_id(pkage_flightScheDTO.getEndSchedule_id());
			}
			
			list.add(dto);
		}
		log.info("Pkage_flightScheDTO list = " + list);
		map.put("pkage_flightScheList", list);
		
		// 비행일정 추가
		int rowCnt = managerPkgDAO.insertPkgFlightSche(map);
		
		// 비행일정 시간으로 패키지 상품의 startDay, endDay 변경
		Pkage_detailDTO pkage_detailDTO = pkageDao.selectPkgDetailById3(pkage_flightScheDTO.getPkage_dt_id());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String meetDate = sdf.format(pkage_detailDTO.getPkage_dt_meetDate());
		pkage_detailDTO.setPkage_dt_meetDate1(meetDate);
		pkage_detailDTO.setPkage_dt_startDay1(pkage_flightScheDTO.getUpdateStartDate());
		pkage_detailDTO.setPkage_dt_endDay1(pkage_flightScheDTO.getUpdateEndDate());
		rowCnt = managerPkgDAO.updatePkgDetail(pkage_detailDTO);
		
		log.info("ManagerPkgServiceImpl insertPkgFlightSche() end...");
		return rowCnt;
	}
	
	// 패키지 상세의 도시에 속하는 호텔들 가져오기
	@Override
	public List<HotelDTORM> selectHotelConnectedPkgDetail(Integer pkage_dt_id) throws Exception {
		log.info("ManagerPkgDAOImpl selectHotelConnectedPkgDetail() start...");
		List<HotelDTORM> list = managerPkgDAO.selectHotelConnectedPkgDetail(pkage_dt_id);
		log.info("ManagerPkgDAOImpl selectHotelConnectedPkgDetail() end...");
		return list;
	}
	
	// 패키지 호텔 추가
	@Override
	public int insertPkgHotel(Pkage_hotelDTO pkage_hotelDTO) throws Exception {
		log.info("ManagerPkgDAOImpl insertPkgHotel() start...");
		int rowCnt = managerPkgDAO.insertPkgHotel(pkage_hotelDTO);
		log.info("ManagerPkgDAOImpl insertPkgHotel() end...");
		return rowCnt;
	}
	
//	pkage_detail 수정
	@Override
	public int updatePkgDetail(Pkage_detailDTO pkage_detailDTO) throws Exception {
		log.info("ManagerPkgServiceImpl updatePkgDetail() start...");
		int rowCnt = managerPkgDAO.updatePkgDetail(pkage_detailDTO);
		log.info("ManagerPkgServiceImpl updatePkgDetail() end...");
		return rowCnt;
	}
	
//	pkage_detail 삭제 (관련 테이블 모두 삭제)
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deletePkgDetailWithAll(Integer pkage_dt_id) throws Exception {
		log.info("ManagerPkgServiceImpl deletePkgDetailWithAll() start...");
		int rowCnt = 0;
		
		// 패키지 숙박 삭제
		rowCnt = managerPkgDAO.deletePkgHotel(pkage_dt_id);
		// 비행일정 삭제
		rowCnt = managerPkgDAO.deletePkgFlight(pkage_dt_id);
		// 여행일정 관광지 삭제
		rowCnt = managerPkgDAO.deletePkgScheDetail(pkage_dt_id);
		// 여행 일정 삭제
		rowCnt = managerPkgDAO.deletePkgSche(pkage_dt_id);
		// 패키지 detail 삭제
		rowCnt = managerPkgDAO.deletePkgDetail(pkage_dt_id);
		
		log.info("ManagerPkgServiceImpl deletePkgDetailWithAll() end...");
		return rowCnt;
	}
}
