package com.oracle.ohTravel.pkage.model;

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
	private Date pkage_dt_meetDate;		// 사전미팅날짜
	private Date pkage_dt_startDay;		// 일정시작날짜
	private Date pkage_dt_endDay;		// 일정정료날짜
	
	// package_flightSche 비행일정
	private List<Pkage_flightScheDTO> pkage_flightScheDTOList;
	
	// package_schedule	여행일정
	private List<Pkage_schedulDTO> pkage_schedulDTOList;
	
	// package_hotel 패키지숙박
	private List<Pkage_hotelDTO> pkage_hotelDTOList;
	
	
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
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		
		c1.setTime(start);
		c2.setTime(end);
		
		// 시분초 초기화
		c1.clear(Calendar.HOUR);
		c1.clear(Calendar.MINUTE);
		c1.clear(Calendar.SECOND);
		c1.clear(Calendar.MILLISECOND);
		c2.clear(Calendar.HOUR);
		c2.clear(Calendar.MINUTE);
		c2.clear(Calendar.SECOND);
		c2.clear(Calendar.MILLISECOND);
//		Calendar -> Date
		start = c1.getTime();
		end = c2.getTime();
		
		// 초 구하기
		long diffDay = (end.getTime() - start.getTime()) / 1000;

		// 일 구하기
		return diffDay/(24*60*60)+1;
	}
}
