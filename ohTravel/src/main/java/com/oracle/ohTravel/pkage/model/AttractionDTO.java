package com.oracle.ohTravel.pkage.model;

import java.util.List;

import lombok.Data;

@Data
public class AttractionDTO {
	private Integer attr_id;	// 관광지ID
	private Integer city_id;	// 도시ID
	private String attr_name;	// 관광지이름
	private String attr_ename;	// 관광지영어이름
	private String attr_info;	// 관광지정보
	
	// attraction_image 관광지 이미지
	List<Attraction_imageDTO> attr_img_DTOList;
}
