package com.oracle.ohTravel.pkage.model;

import lombok.Data;

@Data
public class Pkage_sche_detailDTO {
	private Integer pkage_dt_id;		// 패키지 상세 ID
	private Integer pkage_sche_day;		// 여행일차
	private Integer attr_id;			// 관광지ID
	private Integer	pkage_s_d_order;	// 여행순서
	
	// AttractionDTO 관광지
	private AttractionDTO attrcationDTO;
}
