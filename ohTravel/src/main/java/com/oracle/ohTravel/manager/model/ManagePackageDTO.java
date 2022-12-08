package com.oracle.ohTravel.manager.model;

import lombok.Data;

@Data
public class ManagePackageDTO {
	private String pkage_id;
	private Integer city_id;
	private String pkage_name;
	private String pkage_info;
	private Integer pkage_gubun;
	private Integer pkage_soldCnt;
	private double pkage_score;

	
	//package_detail 
	private Integer pkage_dt_id;
	private String pkage_dt_name;
	private String pkage_dt_thema;
	private Integer pkage_dt_Aprice;
	private Integer pkage_dt_Cprice;
	private Integer pkage_dt_cnt;
	private Integer pkage_dt_Mcnt;
	private Integer pkage_dt_Rcnt;
	private String pkage_dt_Gname;
	private String pkage_dt_meet;
	private String pkage_dt_meetDate;		// 사전미팅날짜
	private String pkage_dt_startDay;		// 일정시작날짜
	private String pkage_dt_endDay;		// 일정정료날짜
	
	//pakcage_image
	private Integer pkage_Img_id;
	private String pkage_Img_path;
	
	//package_schedule
	private Integer pkage_sche_day;
	private String pkage_sche_trans;
	private String pkage_sche_b;
	private String pkage_sche_l;
	private String pkage_sche_d;
	
	//package_flightSche
	private Integer schedule_id;
	private Integer pkage_flight_gubun;
	
	//package_hotel
	private Integer hotel_id;
	
	//packageSchedule_detail
	private Integer pkage_s_d_order;
	
	//attraction
	private Integer attr_id;
	private String attr_name;
	private String attr_ename;
	private String attr_info;
	
	//attraction_image
	private Integer attr_Img_code;
	private String attr_Img_path;
	
	//country
	private int country_id;
	private String country_name;
	//city
	private String city_name;
	
	
	
	//조회용
	private String search;   	private String keyword;
	private String pageNum;  
	private int start;
	private int end;
}
