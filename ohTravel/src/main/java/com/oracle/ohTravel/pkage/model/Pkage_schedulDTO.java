package com.oracle.ohTravel.pkage.model;

import java.util.List;

import lombok.Data;

@Data
public class Pkage_schedulDTO {
	private Integer pkage_sche_day;		// 여행일차
	private Integer pkage_dt_id;		// 패키지 상세 ID
	private String pkage_sche_trans;	// 이동수단
	private String pkage_sche_b;		// 조식
	private String pkage_sche_l;		// 중식
	private String pkage_sche_d;		// 석식
	
	// packageSchedule_detail 여행일정_관광지
	private List<Pkage_sche_detailDTO> pkage_s_dDTOList;
}
