package com.oracle.ohTravel.pkage;

import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Ignore;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.ohTravel.member.dao.MemberDao;
import com.oracle.ohTravel.member.model.UpdateMileGradeDTO;
import com.oracle.ohTravel.pkage.dao.PkageDao;
import com.oracle.ohTravel.pkage.model.PkageDTO;
import com.oracle.ohTravel.pkage.model.PkageDTORM;
import com.oracle.ohTravel.pkage.model.PkgReserveEle;
import com.oracle.ohTravel.pkage.model.PkgSearch;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringRunner.class)
@SpringBootTest // 스프링 부트 띄우고 테스트(이게 없으면 @Autowired 다 실패)
@Transactional // 반복 가능한 테스트 지원, 각각의 테스트를 실행할 때마다 트랜잭션을 시작하고 테스트가 끝나면 트랜잭션을 강제로 롤백 (이 어노테이션이 테스트 케이스에서 사용될 때만 롤백)**
@Slf4j
public class PkageDaoTest {
	@Autowired
	PkageDao pkageDao;
	@Autowired
	MemberDao memberDao;
	
	@Test
	@Ignore
	public void selectPkgBySoldScoreOrderTest() throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("pkage_gubun", 0);
		map.put("row_count", 6);
		
		List<PkageDTO> list = pkageDao.selectPkgBySoldScoreOrder(map);
		
		log.info("list="+list);
		log.info("개수="+list.size());
		assertTrue(list.size()==6);
	}
	
	@Test
	public void selectPkgByThemaSoldScoreOrderTest() throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("thema", "힐링");
		map.put("pkage_gubun", 0);
		map.put("row_count", 6);
		
		List<PkageDTO> list = pkageDao.selectPkgByThemaSoldScoreOrder(map);
		
		log.info("list="+list);
		log.info("개수="+list.size());
		assertTrue(list.size()==6);
	}
	
	@Test
	public void selectPkgWithDetailTest() throws Exception {
		PkgSearch ps = new PkgSearch();
		ps.setPkage_gubun(1);
		ps.setToDesti(420);
		
		Map<String, Object> map = new HashMap<>();
		map.put("toDesti", ps.getToDesti());
		map.put("dates_start_check", ps.getDates_start_check());
		map.put("order", 3); // pkage_soldCnt(1), pkage_score(2), pkage_dt_Aprice(3,4)
		List<PkageDTORM> list = pkageDao.selectPkgWithDetailAndFlight(map);
		
		for(PkageDTORM p : list) {
			System.out.println(p);
		}
	}
	
	@Test
	public void selectPkgByPkgIdTest() throws Exception {
		String pkage_id = "pk420002";
		
		PkageDTORM dto = pkageDao.selectPkgByPkgId(pkage_id);
		log.info("dto="+dto);
		
		assertTrue(dto.getPkage_id().equals(pkage_id));
	}
	
	@Test
//	@Transactional(rollbackFor = Exception.class)
	public void memberDaoTest() throws Exception {
		// 마일리지 update 및 마일리지 등급 변경(필요 시 - 마일리지가 기준 점수를 넘어갔을 때)
		String mem_id = "test1";
		PkgReserveEle pkgReserveEle = new PkgReserveEle();
		pkgReserveEle.setMile(7000);
		
		Map<String, Object> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("pkgReserveEle", pkgReserveEle);
		
		try {
			int rowCnt = 0;
			rowCnt = memberDao.updateMemMileage(map);
			
			UpdateMileGradeDTO updateMile = new UpdateMileGradeDTO();
			updateMile.setMem_id(mem_id);
			updateMile.setResult(0);
			memberDao.updateMemMileGrade(updateMile);
			
			log.info("업데이트 후 updateMile = "+updateMile);
			log.info("updateMemMileGrade 후  rowCnt - " + rowCnt);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
