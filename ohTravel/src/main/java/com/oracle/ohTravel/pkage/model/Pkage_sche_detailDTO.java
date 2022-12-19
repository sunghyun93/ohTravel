package com.oracle.ohTravel.pkage.model;

import java.util.List;

import lombok.Data;

@Data
public class Pkage_sche_detailDTO {
	private Integer pkage_dt_id;		// 패키지 상세 ID
	private Integer pkage_sche_day;		// 여행일차
	private Integer attr_id;			// 관광지ID
	private Integer	pkage_s_d_order;	// 여행순서
	
	// AttractionDTO 관광지
	private AttractionDTO attractionDTO;
	
	// insert 시 받아서 저장 변수들
	private List<Integer> pkage_dt_idL;
	private List<Integer> pkage_sche_dayL;
	private List<Integer> attr_idL;
	private List<Integer> pkage_s_d_orderL;
}
