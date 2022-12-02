package com.oracle.ohTravel.hotel.model;

import lombok.Data;

@Data
public class Hotel_imageDTO {
	private Integer h_img_id;
	private String hotel_id;
	private String h_l_img_path;	// 대표 이미지
	private String h_s_img_path;	// 상세 이미지
}
