package com.oracle.ohTravel.pkage.model;

import java.util.Date;

import lombok.Data;

@Data
public class PkageDTO {
	private int pkage_id;
	private String pkage_name;
	private int pkage_dt_Aprice;
	private int city_id;
	private String pkage_info;
	private int pkage_gubun;
	private int pkage_soldCnt;
	private double pkage_score;
	private String pkage_Img_path;
}
