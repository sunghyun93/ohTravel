package com.oracle.ohTravel.pkage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.pkage.model.PkageDTORM;
import com.oracle.ohTravel.pkage.model.Pkage_detailDTO;
import com.oracle.ohTravel.pkage.model.Pkage_rsDTO;
import com.oracle.ohTravel.pkage.model.Pkage_rs_piDTO;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class PkageDaoImpl implements PkageDao {
	@Autowired
	private SqlSession session;
	
	private final String namespace = "com.oracle.ohTravel.PkageMapper.";
	
//	판매순, 평점순으로 패키지 select (원하는 갯수만)
	@Override
	public List<PkageDTO> selectPkgBySoldScoreOrder(Map<String, Integer> map) throws Exception{
		log.info("PkageDaoImpl selectPkgBySoldScoreOrder() start..."); 
		List<PkageDTO> list = session.selectList(namespace+"selectPkgBySoldScoreOrder", map);
		log.info("list="+list);
		log.info("PkageDaoImpl selectPkgBySoldScoreOrder() end..."); 
		return list;
	}
	
//	테마를 지정하여 판매순, 평점순으로 패키지 select (원하는 갯수만)
	@Override
	public List<PkageDTO> selectPkgByThemaSoldScoreOrder(Map<String, Object> map) throws Exception {
		log.info("PkageDaoImpl selectPkgByThemaSoldScoreOrder() start..."); 
		List<PkageDTO> list = session.selectList(namespace+"selectPkgByThemaSoldScoreOrder", map);
		log.info("list="+list);
		log.info("PkageDaoImpl selectPkgByThemaSoldScoreOrder() end..."); 
		return list;
	}
	
//	패키지 검색시 관련 pkg 테이블들의 값 select
	@Override
	public List<PkageDTORM> selectPkgWithDetailAndFlight(Map<String, Object> map) throws Exception {
		log.info("PkageDaoImpl selectPkgWithDetailAndFlight() start...");
		log.info("PkageDaoImpl selectPkgWithDetailAndFlight() end...");
		return session.selectList(namespace+"selectPkgWithDetailAndFlight", map);
	}
	
//	pkage_id 에 맞는 패키지 select(도시와 이미지까지)
	@Override
	public PkageDTORM selectPkgByPkgId(String pkage_id) throws Exception {
		log.info("PkageDaoImpl selectPkgByPkgId() start...");
		PkageDTORM list = session.selectOne(namespace+"selectPkgByPkgId", pkage_id);
		log.info("PkageDaoImpl selectPkgByPkgId() end...");
		return list;
	}
	
//	pkage_dt_id 에 맞는 패키지 상세 select (관련된 것 모두 가져옴 - 여행일정, 비행일정, 호텔)
	@Override
	public Pkage_detailDTO selectPkgDetailById(Integer pkage_dt_id) throws Exception {
		log.info("PkageDaoImpl selectPkgDetailById() start...");
		log.info("id="+pkage_dt_id);
		Pkage_detailDTO dto = session.selectOne(namespace+"selectPkgDetailById", pkage_dt_id);
		log.info("PkageDaoImpl selectPkgDetailById() end...");
		return dto;
	}
	
//	pkage_dt_id 를 받아 해당 패키지 상세와 관련된 것들 select(패키지 예약때 필요한 정보만 가져오기)
	@Override
	public Pkage_detailDTO selectPkgDetailById2(Integer pkage_dt_id) throws Exception {
		log.info("PkageDaoImpl selectPkgDetailById() start...");
		log.info("id="+pkage_dt_id);
		Pkage_detailDTO dto = session.selectOne(namespace+"selectPkgDetailById2", pkage_dt_id);
		log.info("PkageDaoImpl selectPkgDetailById() end...");
		return dto;
	}
	
//	사용자가 이미 예약한 상품인지 확인
	@Override
	public Integer selectPkgDetailReservCheck(Map<String, Object> map) throws Exception {
		log.info("PkageDaoImpl selectPkgDetailReservCheck() start...");
		int check = session.selectOne(namespace+"selectPkgDetailReservCheck", map);
		log.info("PkageDaoImpl selectPkgDetailReservCheck() end...");
		return check;
	}
	
//	package_reservation insert 문
	@Override
	public int insertPkgReserve(Pkage_rsDTO pkage_rsDTO) throws Exception {
		log.info("PkageDaoImpl insertPkgReserve() start...");
		int rowCnt = session.insert(namespace+"insertPkgReserve", pkage_rsDTO);
		log.info("PkageDaoImpl insertPkgReserve() end...");
		return rowCnt;
	}
	
//	어떤 사용자가 예약을 했을 경우 바로 생긴 pkage_rv_id 가져오기
	@Override
	public int selectPkgRvIdByMemId(String mem_id) throws Exception {
		log.info("PkageDaoImpl selectPkgRvIdByMemId() start...");
		int pkage_rv_id = session.selectOne(namespace+"selectPkgRvIdByMemId", mem_id);
		log.info("PkageDaoImpl selectPkgRvIdByMemId() end...");
		return pkage_rv_id;
	}
	
//	package_reservation_pi 다중 insert 문
	@Override
	public int insertPkgReservePies(Map<String, List<Pkage_rs_piDTO>> map) throws Exception {
		log.info("PkageDaoImpl insertPkgReservePies() start...");
		int rowCnt = session.insert(namespace+"insertPkgReservePies", map);
		log.info("PkageDaoImpl insertPkgReservePies() end...");
		return rowCnt;
	}
	
//	package 판매 update 문
	@Override
	public int updatePkgSoldCnt(String pkage_id) throws Exception {
		log.info("PkageDaoImpl updatePkgSoldCnt() start...");
		int rowCnt = session.update(namespace+"updatePkgSoldCnt", pkage_id);
		log.info("PkageDaoImpl updatePkgSoldCnt() end...");
		return rowCnt;
	}
	
//	결제 후 해당 패키지 detail의 잔여좌석 update
	@Override
	public int updatePkgDetailRcnt(Map<String, Object> map) throws Exception {
		log.info("PkageDaoImpl updatePkgDetailRcnt() start...");
		int rowCnt = session.update(namespace+"updatePkgDetailRcnt", map);
		log.info("PkageDaoImpl updatePkgDetailRcnt() end...");
		return rowCnt;
	}
}
