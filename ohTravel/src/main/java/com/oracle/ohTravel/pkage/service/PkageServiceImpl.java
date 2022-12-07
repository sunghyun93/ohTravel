package com.oracle.ohTravel.pkage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.ohTravel.pkage.dao.PkageDao;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.pkage.model.PkageDTORM;
import com.oracle.ohTravel.pkage.model.Pkage_detailDTO;
import com.oracle.ohTravel.pkage.model.Pkage_rsDTO;
import com.oracle.ohTravel.pkage.model.Pkage_rs_piDTO;
import com.oracle.ohTravel.pkage.model.PkgReserveEle;
import com.oracle.ohTravel.review.dao.ReviewDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PkageServiceImpl implements PkageService {
	@Autowired
	private PkageDao pkageDao;
	@Autowired
	private ReviewDAO reviewDao;
	
//	판매순, 평점순으로 패키지 select (원하는 갯수만)
	@Override
	public List<PkageDTO> selectPkgBySoldScoreOrder(Map<String, Integer> map) throws Exception {
		log.info("PkageServiceImpl selectPkgBySoldScoreOrder() start...");
		List<PkageDTO> list = pkageDao.selectPkgBySoldScoreOrder(map);
		log.info("PkageServiceImpl selectPkgBySoldScoreOrder() end...");
		return list;
	}
	
//	테마를 지정하여 판매순, 평점순으로 패키지 select (원하는 갯수만)
	@Override
	public List<PkageDTO> selectPkgByThemaSoldScoreOrder(Map<String, Object> map) throws Exception {
		log.info("PkageServiceImpl selectPkgByThemaSoldScoreOrder() start...");
		List<PkageDTO> list = pkageDao.selectPkgByThemaSoldScoreOrder(map);
		log.info("PkageServiceImpl selectPkgByThemaSoldScoreOrder() end...");
		return list;
	}
	
//	패키지 검색시 관련 pkg 테이블들의 값 select
	@Override
	public List<PkageDTORM> selectPkgWithDetailAndFlight(Map<String, Object> map) throws Exception {
		log.info("PkageServiceImpl selectPkgWithDetailAndFlight() start...");
		List<PkageDTORM> list = pkageDao.selectPkgWithDetailAndFlight(map);
		
		for(PkageDTORM dto : list) {
			// 리뷰 개수 채우기
			String rv_real_id = dto.getPkage_id();
			int reviewCnt = reviewDao.reviewCnt(rv_real_id);
			dto.setReviewCnt(reviewCnt);
		}
		
		log.info("PkageServiceImpl selectPkgWithDetailAndFlight() end...");
		return list;
	}
	
//	pkage_id 에 맞는 패키지 select(도시와 이미지까지), review 개수 select, package_detail select
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
	
//	pkage_id 에 맞는 패키지 select(도시와 이미지까지)
	@Override
	public PkageDTORM selectPkgByPkgId(String pkage_id) throws Exception {
		log.info("PkageServiceImpl selectPkgByPkgId() start...");
		PkageDTORM pkageDTORM = pkageDao.selectPkgByPkgId(pkage_id);
		log.info("PkageServiceImpl selectPkgByPkgId() end...");
		return pkageDTORM;
	}
	
//	pkage_dt_id 를 받아 해당 패키지 상세와 관련된 것들 select(패키지 예약때 필요한 정보만 가져오기)
	@Override
	public Pkage_detailDTO selectPkgDetailById2(Integer pkage_dt_id) throws Exception {
		log.info("PkageServiceImpl selectPkgDetailById2() start...");
		// package_detail 가져오기(여행일정, 비행일정, 호텔)
		Pkage_detailDTO pkage_detailDTO = pkageDao.selectPkgDetailById2(pkage_dt_id);
		
		log.info("PkageServiceImpl selectPkgDetailById2() end...");
		return pkage_detailDTO;
	}
	
//	패키지 예약 관련 insert 및 update
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertPkgReserveInsertWithAll(Map<String, Object> map) throws Exception {
		int rowCnt = 0;
	// 패키지 예약 insert
		rowCnt = pkageDao.insertPkgReserve((Pkage_rsDTO)map.get("pkage_rsDTO"));
		
	// 방금 생성된 패키지 예약 ID 가져오기
		int pkage_rv_id = pkageDao.selectPkgRvIdByMemId((String)map.get("mem_id"));
		log.info("pkage_rv_id = " + pkage_rv_id);
		
	// 패키지 인원 정보 insert
		List<Pkage_rs_piDTO> pkage_rs_piDTOList = new ArrayList<>(); // 한번에 insert 할 list 만들기
		
		PkgReserveEle pkageReserveEle = (PkgReserveEle)map.get("pkgReserveEle");
		int totalCnt = pkageReserveEle.getPkage_pi_name().size(); // 넣어야 할 여행자 인원 수
		log.info("totalCnt = "+totalCnt);
		
		// 인원 수 만큼 Pkage_rs_piDTO 만들어서 list에 추가 
		for(int i = 0; i < totalCnt; i++) {
			Pkage_rs_piDTO pkage_rs_piDTO = new Pkage_rs_piDTO();
			pkage_rs_piDTO.setPkage_rv_id(pkage_rv_id);										// 예약ID
			pkage_rs_piDTO.setPkage_pi_name(pkageReserveEle.getPkage_pi_name().get(i));		// 이름
			pkage_rs_piDTO.setPkage_pi_birth(pkageReserveEle.getPkage_pi_birth().get(i));	// 생년월일
			pkage_rs_piDTO.setPkage_pi_gen(pkageReserveEle.getPkage_pi_gen().get(i));		// 성별
			pkage_rs_piDTO.setPkage_pi_lname(pkageReserveEle.getPkage_pi_lname().get(i));	// 영문성
			pkage_rs_piDTO.setPkage_pi_fname(pkageReserveEle.getPkage_pi_fname().get(i));	// 영문이름
			
			// 이메일 / 전호번호 는 성인과 아동을 구분해줘야함 (아동에는 null 값이 들어가야한다 , 아동은 이메일, 전화번호값에 0이 들어잆음)
			if(pkageReserveEle.getPkage_pi_email().get(i).equals("0")) {
				pkage_rs_piDTO.setPkage_pi_email(null);
				pkage_rs_piDTO.setPkage_pi_tel(null);
			} else {
				pkage_rs_piDTO.setPkage_pi_email(pkageReserveEle.getPkage_pi_email().get(i));	// 이메일
				pkage_rs_piDTO.setPkage_pi_tel(pkageReserveEle.getPkage_pi_tel().get(i));		// 전화번호
			}	
			
			// Pkage_rs_piDTO 만들어서 넣어주기
			pkage_rs_piDTOList.add(pkage_rs_piDTO);
		}
		log.info("pkage_rs_piDTOList = " + pkage_rs_piDTOList);
		
		Map<String, List<Pkage_rs_piDTO>> insertMap = new HashMap<>();
		insertMap.put("pkage_rs_piDTOList", pkage_rs_piDTOList);
		rowCnt = pkageDao.insertPkgReservePies(insertMap);
		
	// 패키지 판매 update
		rowCnt = pkageDao.updatePkgSoldCnt(pkageReserveEle.getPkage_id());
		
	// 마일리지 update
		
	// 쿠폰 사용 시 쿠폰 사용내역 update
		
	// 결제 정보 insert
		
		return rowCnt;
	}
}
