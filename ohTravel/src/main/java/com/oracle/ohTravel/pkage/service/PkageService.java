package com.oracle.ohTravel.pkage.service;

import java.util.List;
import java.util.Map;

import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.pkage.model.PkageDTORM;
import com.oracle.ohTravel.pkage.model.Pkage_detailDTO;
import com.oracle.ohTravel.pkage.model.Pkage_rsDTO;
import com.oracle.ohTravel.pkage.model.PkgSearch;

public interface PkageService {
	List<PkageDTO> selectPkgBySoldScoreOrder(Map<String, Integer> map) throws Exception;
	List<PkageDTO> selectPkgByThemaSoldScoreOrder(Map<String, Object> map) throws Exception;
	List<PkageDTORM> selectPkgWithDetailAndFlight(Map<String, Object> map) throws Exception;
	PkageDTORM selectPkgDetailWithSchedule(Map<String, Object> map) throws Exception;
	PkageDTORM selectPkgByPkgId(String pkage_id) throws Exception;
	Pkage_detailDTO selectPkgDetailById2(Integer pkage_dt_id) throws Exception;
	Integer selectPkgDetailReservCheck(Map<String, Object> map) throws Exception;
	Map<String, Object> insertPkgReserveInsertWithAll(Map<String, Object> map) throws Exception;
	Pkage_rsDTO selectPkgReservById(Integer pkage_rv_id) throws Exception;
}
