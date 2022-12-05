package com.oracle.ohTravel.pkage.dao;

import java.util.List;
import java.util.Map;

import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.pkage.model.PkageDTORM;
import com.oracle.ohTravel.pkage.model.Pkage_detailDTO;
import com.oracle.ohTravel.pkage.model.PkgSearch;

public interface PkageDao {
	List<PkageDTO> selectPkgBySoldScoreOrder(Map<String, Integer> map) throws Exception;
	List<PkageDTO> selectPkgByThemaSoldScoreOrder(Map<String, Object> map) throws Exception;
	List<PkageDTORM> selectPkgWithDetailAndFlight(Map<String, Object> map) throws Exception;
	PkageDTORM selectPkgByPkgId(String pkage_id) throws Exception;
	Pkage_detailDTO selectPkgDetailById(Integer pkage_dt_id) throws Exception;
	Pkage_detailDTO selectPkgDetailById2(Integer pkage_dt_id) throws Exception;
}
