package com.oracle.ohTravel.pkage.service;

import java.util.List;
import java.util.Map;

import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.pkage.model.PkageDTORM;

public interface PkageService {
	List<PkageDTO> selectPkgBySoldScoreOrder(Map<String, Integer> map) throws Exception;
	List<PkageDTO> selectPkgByThemaSoldScoreOrder(Map<String, Object> map) throws Exception;
	List<PkageDTORM> selectPkgWithDetail() throws Exception;
}
