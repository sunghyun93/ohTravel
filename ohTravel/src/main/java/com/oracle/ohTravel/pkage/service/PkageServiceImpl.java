package com.oracle.ohTravel.pkage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.ohTravel.pkage.dao.PkageDao;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.pkage.model.PkageDTORM;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PkageServiceImpl implements PkageService {
	@Autowired
	private PkageDao pkageDao;
	
	@Override
	public List<PkageDTO> selectPkgBySoldScoreOrder(Map<String, Integer> map) throws Exception {
		log.info("PkageServiceImpl selectPkgBySoldScoreOrder() start...");
		List<PkageDTO> list = pkageDao.selectPkgBySoldScoreOrder(map);
		log.info("PkageServiceImpl selectPkgBySoldScoreOrder() end...");
		return list;
	}
	
	@Override
	public List<PkageDTO> selectPkgByThemaSoldScoreOrder(Map<String, Object> map) throws Exception {
		log.info("PkageServiceImpl selectPkgByThemaSoldScoreOrder() start...");
		List<PkageDTO> list = pkageDao.selectPkgByThemaSoldScoreOrder(map);
		log.info("PkageServiceImpl selectPkgByThemaSoldScoreOrder() end...");
		return list;
	}
	
	@Override
	public List<PkageDTORM> selectPkgWithDetail() throws Exception {
		return pkageDao.selectPkgWithDetail();
	}
}
