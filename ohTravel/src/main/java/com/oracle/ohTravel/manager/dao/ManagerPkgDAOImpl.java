package com.oracle.ohTravel.manager.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.airport.model.Air_ScheduleDTORM;
import com.oracle.ohTravel.hotel.model.HotelDTORM;
import com.oracle.ohTravel.pkage.model.AttractionDTO;
import com.oracle.ohTravel.pkage.model.Pkage_detailDTO;
import com.oracle.ohTravel.pkage.model.Pkage_hotelDTO;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ManagerPkgDAOImpl implements ManagerPkgDAO {
	@Autowired
	private SqlSession session;
	private String namespace = "com.oracle.ohTravel.ManagePkg.";

// 패키지 상세 추가 insert 및 select 문들
	// 패키지 상세 추가
	@Override
	public int insertPackage1(Pkage_detailDTO pk) throws Exception {
		log.info("ManagerPkgDAOImpl insertPackage1() start...");
		int rowCnt = session.insert(namespace+"insertPackage1", pk);
		log.info("ManagerPkgDAOImpl insertPackage1() end...");
		return rowCnt;
	}
	
	// 패키지 상세 추가 후 가장 최근의 pkage_dt_id 가져오기
	@Override
	public int selectRecentPkageDtId(String pkage_id) throws Exception {
		log.info("ManagerPkgDAOImpl selectRecentPkageDtId() start...");
		int pkage_dt_id = session.selectOne(namespace+"selectRecentPkageDtId", pkage_id);
		log.info("ManagerPkgDAOImpl selectRecentPkageDtId() end...");
		return pkage_dt_id;
	}
	
	// 패키지 여행 일정 추가
	@Override
	public int insertPkgSche(Map<String, Object> map) throws Exception {
		log.info("ManagerPkgDAOImpl insertPkgSche() start...");
		int rowCnt = session.insert(namespace+"insertPkgSche", map);
		log.info("ManagerPkgDAOImpl insertPkgSche() end...");
		return rowCnt;
	}
	
	// pkage_detail 과 해당 패키지의 도시에 해당하는 관광지 가져오기
	@Override
	public List<AttractionDTO> selectAttrConnectedPkgDetail(String pkage_dt_id) throws Exception {
		log.info("ManagerPkgDAOImpl selectCityIdConnectedPkgDetail() start...");
		List<AttractionDTO> list = session.selectList(namespace+"selectAttrConnectedPkgDetail", pkage_dt_id);
		log.info("ManagerPkgDAOImpl selectCityIdConnectedPkgDetail() end...");
		return list;
	}
	
	// pkage_detail 과 해당하는 도시ID 가져오기
	@Override
	public int selectCityIdConnectedPkgDetail(Integer pkage_dt_id) throws Exception {
		log.info("ManagerPkgDAOImpl selectCityIdConnectedPkgDetail() start...");
		int city_id = session.selectOne(namespace+"selectCityIdConnectedPkgDetail", pkage_dt_id);
		log.info("ManagerPkgDAOImpl selectCityIdConnectedPkgDetail() end...");
		return city_id;
	}
	
	// 패키지 여행일정_관광지 추가
	@Override
	public int insertPkgScheDetail(Map<String, Object> map) throws Exception {
		log.info("ManagerPkgDAOImpl insertPkgScheDetail() start...");
		int rowCnt = session.insert(namespace+"insertPkgScheDetail", map);
		log.info("ManagerPkgDAOImpl insertPkgScheDetail() end...");
		return rowCnt;
	}
	
	// 패키지 상세 일정과 맞는 날짜의 비행일정 가져오기 (출발 시작/도착 시작은 모조건 인천)
	@Override
	public List<Air_ScheduleDTORM> selectAirScheConnectedPkgDetail(Map<String, Object> map) throws Exception {
		log.info("ManagerPkgDAOImpl selectAirScheConnectedPkgDetail() start...");
		List<Air_ScheduleDTORM> list = session.selectList(namespace+"selectAirScheConnectedPkgDetail", map);
		log.info("ManagerPkgDAOImpl selectAirScheConnectedPkgDetail() end...");
		return list;
	}
	
	// 패키지 비행일정 추가
	@Override
	public int insertPkgFlightSche(Map<String, Object> map) throws Exception {
		log.info("ManagerPkgDAOImpl insertPkgFlightSche() start...");
		int rowCnt = session.insert(namespace+"insertPkgFlightSche", map);
		log.info("ManagerPkgDAOImpl insertPkgFlightSche() end...");
		return rowCnt;
	}
	
	// 패키지 상세의 도시에 속하는 호텔들 가져오기
	@Override
	public List<HotelDTORM> selectHotelConnectedPkgDetail(Integer pkage_dt_id) throws Exception {
		log.info("ManagerPkgDAOImpl selectHotelConnectedPkgDetail() start...");
		List<HotelDTORM> list = session.selectList(namespace+"selectHotelConnectedPkgDetail", pkage_dt_id);
		log.info("ManagerPkgDAOImpl selectHotelConnectedPkgDetail() end...");
		return list;
	}
	
	// 패키지 호텔 추가
	@Override
	public int insertPkgHotel(Pkage_hotelDTO pkage_hotelDTO) throws Exception {
		log.info("ManagerPkgDAOImpl insertPkgHotel() start...");
		int rowCnt = session.insert(namespace+"insertPkgHotel", pkage_hotelDTO);
		log.info("ManagerPkgDAOImpl insertPkgHotel() end...");
		return rowCnt;
	}
	
//	pkage_detail 수정
	@Override
	public int updatePkgDetail(Pkage_detailDTO pkage_detailDTO) throws Exception {
		log.info("ManagerPkgDAOImpl updatePkgDetail() start...");
		int rowCnt = session.update(namespace+"updatePkgDetail", pkage_detailDTO);
		log.info("ManagerPkgDAOImpl updatePkgDetail() end...");
		return rowCnt;
	}
	
//	패키지 상세 관련 delete
	// 패키지 상세 delete
	@Override
	public int deletePkgDetail(Integer pkage_dt_id) throws Exception {
		log.info("ManagerPkgDAOImpl deletePkgDetail() start...");
		int rowCnt = session.delete(namespace+"deletePkgDetail", pkage_dt_id);
		log.info("ManagerPkgDAOImpl deletePkgDetail() end...");
		return rowCnt;
	}
	
	// 패키지 여행 일정 delete deletePkgSche
	@Override
	public int deletePkgSche(Integer pkage_dt_id) throws Exception {
		log.info("ManagerPkgDAOImpl deletePkgSche() start...");
		int rowCnt = session.delete(namespace+"deletePkgSche", pkage_dt_id);
		log.info("ManagerPkgDAOImpl deletePkgSche() end...");
		return rowCnt;
	}
	
	// 패키지 여행일정_관광지 delete deletePkgScheDetail
	@Override
	public int deletePkgScheDetail(Integer pkage_dt_id) throws Exception {
		log.info("ManagerPkgDAOImpl deletePkgScheDetail() start...");
		int rowCnt = session.delete(namespace+"deletePkgScheDetail", pkage_dt_id);
		log.info("ManagerPkgDAOImpl deletePkgScheDetail() end...");
		return rowCnt;
	}
	
	// 패키지 비행일정 delete deletePkgFlight
	@Override
	public int deletePkgFlight(Integer pkage_dt_id) throws Exception {
		log.info("ManagerPkgDAOImpl deletePkgFlight() start...");
		int rowCnt = session.delete(namespace+"deletePkgFlight", pkage_dt_id);
		log.info("ManagerPkgDAOImpl deletePkgFlight() end...");
		return rowCnt;
	}
	
	// 패키지 숙박 delete deletePkgHotel
	@Override
	public int deletePkgHotel(Integer pkage_dt_id) throws Exception {
		log.info("ManagerPkgDAOImpl deletePkgHotel() start...");
		int rowCnt = session.delete(namespace+"deletePkgHotel", pkage_dt_id);
		log.info("ManagerPkgDAOImpl deletePkgHotel() end...");
		return rowCnt;
	}
}
