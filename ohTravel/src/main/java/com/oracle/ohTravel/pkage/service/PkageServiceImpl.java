package com.oracle.ohTravel.pkage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.ohTravel.pkage.dao.PkageDao;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.pkage.model.PkageDTORM;
import com.oracle.ohTravel.pkage.model.Pkage_detailDTO;
import com.oracle.ohTravel.review.dao.ReviewDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PkageServiceImpl implements PkageService {
	@Autowired
	private PkageDao pkageDao;
	@Autowired
	private ReviewDAO reviewDao;
	
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
	public List<PkageDTORM> selectPkgWithDetailAndFlight(Map<String, Object> map) throws Exception {
		log.info("PkageServiceImpl selectPkgByThemaSoldScoreOrder() start...");
		List<PkageDTORM> list = pkageDao.selectPkgWithDetailAndFlight(map);
		
		for(PkageDTORM dto : list) {
			// 리뷰 개수 채우기
			String rv_real_id = dto.getPkage_id();
			int reviewCnt = reviewDao.reviewCnt(rv_real_id);
			dto.setReviewCnt(reviewCnt);
		}
		
		log.info("PkageServiceImpl selectPkgByThemaSoldScoreOrder() end...");
		return list;
	}
	
	@Override
	public PkageDTORM selectPkgDetailWithSchedule(Map<String, Object> map) throws Exception {
		log.info("PkageServiceImpl selectPkgDetailWithSchedule() start...");
		// package 가져오기 (이미지, 도시, 리뷰 수 등등)
		PkageDTORM pkageDTORM = pkageDao.selectPkgByPkgId((String)map.get("pkage_id"));
		
		// 리뷰 개수 가져오기
		int reviewCnt = reviewDao.reviewCnt((String)map.get("pkage_id"));
		
		// 리뷰 가져오기
		
		// package_detail 가져오기(여행일정, 비행일정, 호텔)
		Pkage_detailDTO pkage_detailDTO = pkageDao.selectPkgDetailById((Integer)map.get("pkage_dt_id"));
		
		// PkageDTORM 에 합치기
		pkageDTORM.setReviewCnt(reviewCnt);
		pkageDTORM.setPkage_detailDTO(pkage_detailDTO);
		
		log.info("PkageServiceImpl selectPkgDetailWithSchedule() end...");
		return pkageDTORM;
	}
}
