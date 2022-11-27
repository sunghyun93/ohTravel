package com.oracle.ohTravel.pkage.dao;

import java.util.List;
import java.util.Map;

import com.oracle.ohTravel.pkage.model.PkageDTO;

public interface PkageDao {
	public List<PkageDTO> selectPkgBySoldScoreOrder(Map<String, Integer> map) throws Exception;
	public List<PkageDTO> selectPkgByThemaSoldScoreOrder(Map<String, Object> map) throws Exception;
}
