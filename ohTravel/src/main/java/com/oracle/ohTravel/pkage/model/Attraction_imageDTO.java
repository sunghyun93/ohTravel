package com.oracle.ohTravel.pkage.model;

import lombok.Data;

@Data
public class Attraction_imageDTO {
	private Integer attr_img_code;	// 이미지ID
	private Integer attr_id;		// 관광지ID
	private	String attr_img_path;	// 이미지 경로
}
