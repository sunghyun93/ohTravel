package com.oracle.ohTravel.pkage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.pkage.model.PkageDTO;

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

}
