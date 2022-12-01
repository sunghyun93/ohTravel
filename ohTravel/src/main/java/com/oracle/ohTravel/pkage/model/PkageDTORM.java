package com.oracle.ohTravel.pkage.model;

import java.util.List;

import com.oracle.ohTravel.city.model.CityDTO;

import lombok.Data;

// resultMap 을 위한 DTO
@Data
public class PkageDTORM {
	private String pkage_id;		// 패키지 ID
	private Integer city_id;		// 도시 ID
	private String pkage_name;		// 패키지명
	private String pkage_info;		// 패키지 정보
	private Integer pkage_gubun;	// 해외 국내 여부
	private Integer pkage_soldCnt;	// 판매개수
	private double pkage_score;		// 평점
	
	// city
	private CityDTO cityDTO;
	
	// package_detail
	private List<Pkage_detailDTO> pkage_detailDTOList;
	private Pkage_detailDTO pkage_detailDTO;
	
	// package_image
	private List<Pkage_imageDTO> pkage_imageDTOList;
	
	// 더미 변수
	private int minPrice; 		// 패키지 상세들 중 최소가격
	private int pkgDetailCnt;	// 관련 패키지 내의 detail 개수
	private long[] days;	// 종합 일수 (전체 상품 디테일들 중 최소 기간과 최대기간)
	private int reviewCnt;	// 리뷰 개수
	
}
