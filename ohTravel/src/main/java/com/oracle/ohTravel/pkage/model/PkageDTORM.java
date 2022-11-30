package com.oracle.ohTravel.pkage.model;

import java.util.List;

import com.oracle.ohTravel.city.model.CityDTO;

import lombok.Data;

@Data
public class PkageDTORM {
	private String pkage_id;
	private Integer city_id;
	private String pkage_name;
	private String pkage_info;
	private Integer pkage_gubun;
	private Integer pkage_soldCnt;
	private double pkage_score;
	
	// city
	private CityDTO cityDTO;
	
	// package_detail
	private List<Pkage_detailDTO> pkage_detailDTOList;
	
	// package_image
	private List<Pkage_imageDTO> pkage_imageDTOList;
	
	// 더미 변수
	private int minPrice; 		// 패키지 상세들 중 최소가격
	private int pkgDetailCnt;	// 관련 패키지 내의 detail 개수
	private long[] days;	// 종합 일수
	
}
