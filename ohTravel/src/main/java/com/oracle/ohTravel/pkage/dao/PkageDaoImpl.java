package com.oracle.ohTravel.pkage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.pkage.model.PkageDTORM;
import com.oracle.ohTravel.pkage.model.Pkage_detailDTO;

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
}
