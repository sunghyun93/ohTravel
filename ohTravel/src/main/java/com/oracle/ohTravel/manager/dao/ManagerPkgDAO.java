package com.oracle.ohTravel.manager.dao;

import java.util.List;
import java.util.Map;

import com.oracle.ohTravel.airport.model.Air_ScheduleDTORM;
import com.oracle.ohTravel.hotel.model.HotelDTORM;
import com.oracle.ohTravel.manager.model.ManagePackageDTO;
import com.oracle.ohTravel.pkage.model.AttractionDTO;
import com.oracle.ohTravel.pkage.model.Pkage_detailDTO;
import com.oracle.ohTravel.pkage.model.Pkage_hotelDTO;

public interface ManagerPkgDAO {
// 패키지 상세 추가 insert 및 select 문들
	int insertPackage1(Pkage_detailDTO pk) throws Exception;
	int selectRecentPkageDtId(String pkage_id) throws Exception;
	int insertPkgSche(Map<String, Object> map) throws Exception;
	List<AttractionDTO> selectAttrConnectedPkgDetail(String pkage_dt_id) throws Exception;
	int selectCityIdConnectedPkgDetail(Integer pkage_dt_id) throws Exception;
	int insertPkgScheDetail(Map<String, Object> map) throws Exception;
	List<Air_ScheduleDTORM> selectAirScheConnectedPkgDetail(Map<String, Object> map) throws Exception;
	int insertPkgFlightSche(Map<String, Object> map) throws Exception;
	List<HotelDTORM> selectHotelConnectedPkgDetail(Integer pkage_dt_id) throws Exception;
	int insertPkgHotel(Pkage_hotelDTO pkage_hotelDTO) throws Exception;
//	pkage_detail 수정
	int updatePkgDetail(Pkage_detailDTO pkage_detailDTO) throws Exception;
//	패키지 상세 관련 delete
	int deletePkgDetail(Integer pkage_dt_id) throws Exception;
	int deletePkgSche(Integer pkage_dt_id) throws Exception;
	int deletePkgScheDetail(Integer pkage_dt_id) throws Exception;
	int deletePkgFlight(Integer pkage_dt_id) throws Exception;
	int deletePkgHotel(Integer pkage_dt_id) throws Exception;
}
