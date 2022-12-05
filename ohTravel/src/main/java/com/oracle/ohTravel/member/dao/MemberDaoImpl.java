package com.oracle.ohTravel.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.member.model.AirReservationDTO;
import com.oracle.ohTravel.member.model.HotelReservationDTO;
import com.oracle.ohTravel.member.model.MemberDTO;
import com.oracle.ohTravel.member.model.PackageReservationDTO;
import com.oracle.ohTravel.member.model.TicketReservationDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSession sqlSession;
	
	// 로그인
	@Override
	public MemberDTO login(MemberDTO memberDTO) {
		log.info("MemberDaoImpl login Start..");
		MemberDTO res = null;
		
		try {
			res = sqlSession.selectOne("login", memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	// 회원가입
	@Override
	public int register(MemberDTO memberDTO) {
		log.info("MemberDaoImpl register Start..");
		int result = sqlSession.insert("register", memberDTO);
		
		return result;
	}

	// 티켓 예약 내역
	@Override
	public List<TicketReservationDTO> myPageReservTicket(TicketReservationDTO ticketReservationDTO) {
		log.info("MemberDaoImpl myPageReservTicket Start..");
		List<TicketReservationDTO> ticketReservList = sqlSession.selectList("ticketReservList", ticketReservationDTO);
		
		System.out.println("MemberDaoImpl myPageReservTicket ticketReservList.size() -> "+ ticketReservList.size());
		return ticketReservList;
	}

	// 항공 예약 내역
	@Override
	public List<AirReservationDTO> myPageReservAir(AirReservationDTO airReservationDTO) {
		log.info("MemberDaoImpl myPageReservTicket Start..");
		List<AirReservationDTO> airReservList = sqlSession.selectList("airReservList", airReservationDTO);
		
		System.out.println("MemberDaoImpl myPageReservAir airReservList.size() -> " + airReservList.size());
		return airReservList;
	}

	// 호텔 예약 내역
	@Override
	public List<HotelReservationDTO> myPageReservHotel(HotelReservationDTO hotelReservationDTO) {
		log.info("MemberDaoImpl myPageReservHotel Start..");
		List<HotelReservationDTO> hotelReservList = sqlSession.selectList("hotelReservList", hotelReservationDTO);
		
		System.out.println("MemberDaoImpl myPageReservHotel hotelReservList.size() -> " + hotelReservList.size());
		return hotelReservList;
	}

	// 패키지 예약 내역
	@Override
	public List<PackageReservationDTO> myPageReservPackage(PackageReservationDTO packageReservationDTO) {
		log.info("MemberDaoImpl myPageReservPackage Start..");
		List<PackageReservationDTO> packageReservList = sqlSession.selectList("packageReservList", packageReservationDTO);
		
		System.out.println("MemberDaoImpl myPageReservPackage packageReservList.size() -> " + packageReservList.size());
		return packageReservList;
	}

	// 회원 탈퇴
	@Override
	public int deleteMember(MemberDTO memberDTO) {
		log.info("MemberDaoImpl deleteMember start..");
		int result = sqlSession.delete("deleteMember", memberDTO);
		System.out.println("MemberDaoImpl deleteMember memberDTO.getMem_id() -> " + memberDTO.getMem_id());
		
		return result;
	}
	
}
