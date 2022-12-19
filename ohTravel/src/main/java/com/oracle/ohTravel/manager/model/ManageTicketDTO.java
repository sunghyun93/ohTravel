package com.oracle.ohTravel.manager.model;

import java.sql.Date;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ManageTicketDTO {
	private String ticket_id;
	private String ticket_name;
	private int city_id;
	private int ticket_sales_cnt;
	private String ticket_location;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String ticket_due_date;
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
	
	private Integer ticket_order_id;
	private String mem_id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String ticket_puchase_date;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ticket_admission_date;
	private Integer ticket_adult_per;
	private Integer ticket_child_per;
	private Integer ticket_total_price;
	
	
	
	public void makeTotalPay(int aPrice, int cPrice) {
		if(this.ticket_adult_per == null) ticket_adult_per = 0;
		if(this.ticket_child_per == null) ticket_child_per = 0;
		
		this.ticket_total_price = (this.ticket_adult_per * aPrice) + (this.ticket_child_per * cPrice);
	}
	//조회용
	private String search;   	private String keyword;
	private String pageNum;  
	private int start;
	private int end;
}
