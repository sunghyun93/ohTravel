package com.oracle.ohTravel.manager.model;

import java.math.BigDecimal;
import java.sql.Date;

import lombok.Data;

@Data
public class ManageTicketDTO {
	private String ticket_id;
	private String ticket_name;
	private int city_id;
	private int ticket_sales_cnt;
	private String ticket_location;
	private Date ticket_due_date;
	private int ticket_adult_price;
	private int ticket_child_price;
	
	//입장권 이미지
	private int ticket_img_id;
	private String ticket_rep_img_path;
	private String ticket_detail_img_path;
	
	//국가
	private int country_id;
	private String country_name;
	//도시
	private String city_name;
	
	
	//조회용
	private String search;   	private String keyword;
	private String pageNum;  
	private int start;
	private int end;
}
