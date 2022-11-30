package com.oracle.ohTravel.pkage.model;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Pkage_detailDTO {
	private Integer pkage_dt_id;		// 패키지 상세 번호
	private String pkage_id;			// 패키지 번호
	private String pkage_dt_name;		// 패키지 상세 이름
	private String pkage_dt_thema;		// 테마
	private Integer pkage_dt_Aprice;	// 성인가격
	private Integer pkage_dt_Cprice;	// 아동가격
	private Integer pkage_dt_cnt;		// 패키지인원
	private Integer pkage_dt_Mcnt;		// 패키지 최소인원
	private Integer pkage_dt_Rcnt;		// 예약인원
	private String pkage_dt_Gname; 		// 가이드이름
	private String pkage_dt_meet;		// 사전미팅장소
	private Timestamp pkage_dt_meetDate;		// 사전미팅날짜
	private Date pkage_dt_startDay;		// 일정시작날짜
	private Date pkage_dt_endDay;		// 일정정료날짜
	
	// package_flightSche
	private List<Pkage_flightScheDTO> pkage_flightScheDTOList;
	
	// 더미 변수
	private String startYoil;	// 출발 요일
	private String endYoil;		// 도착 요일
	private long day;			// 일수
	
	// 요일 구하는 함수
	public String getYoil(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		
		return " 일월화수목금토".charAt(c.get(Calendar.DAY_OF_WEEK))+"";
	}
	
	// 일수 구하는 함수
	public long getDay(Date start, Date end) {
		// 초 구하기
		long diffDay = (end.getTime() - start.getTime()) / 1000;

		// 일 구하기
		return diffDay/(24*60*60)+1;
	}
}
