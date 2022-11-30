package com.oracle.ohTravel.airport.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.airport.model.AirSearch;
import com.oracle.ohTravel.airport.model.Air_ScheduleDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ScheduleDAOImpl implements ScheduleDAO {
	
	private final SqlSession session;
	private String namespace = "com.oracle.ohTravel.AirportMapper.";

	@Override
	public List<Air_ScheduleDTO> airplaneList(AirSearch airSearch) {
		System.out.println("ScheduleDAOImpl airSeach="+airSearch);
		List<Air_ScheduleDTO> list1 = null;
		try {
			list1 = session.selectList(namespace + "airplaneList", airSearch);
			System.out.println("ScheduleDAOImpl airplaneList list1=" + list1);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list1;
	}

	@Override
	public List<Air_ScheduleDTO> round_airplaneList(AirSearch airSearch) {
		
		
		List<Air_ScheduleDTO> list2 = null;
		try {
			
			list2 = session.selectList(namespace + "round_airplaneList", airSearch);
			System.out.println("ScheduleDAOImpl airplaneList list2=" + list2);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list2;
	}

	@Override
	public List<Air_ScheduleDTO> round_GoairplaneList(AirSearch airSearch) {
		List<Air_ScheduleDTO> list3 = null;
		try {
			
			list3 = session.selectList(namespace + "round_goairplaneList", airSearch);
			System.out.println("ScheduleDAOImpl airplaneList list2=" + list3);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list3;
	}

}
