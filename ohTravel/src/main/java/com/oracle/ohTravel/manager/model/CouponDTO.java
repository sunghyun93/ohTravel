package com.oracle.ohTravel.manager.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CouponDTO {
	//기본 쿠폰
	private int coupon_id;
	private String coupon_name;
	private int coupon_discount;
	private Timestamp coupon_date;
	private int coupon_quantity;
	
	//맴버쿠폰테이블
	private String mem_id;
	private Timestamp coupon_down;
	private int coupon_use;
	private Timestamp coupon_limit_date;
	
	
	//회원 쿠폰이 있는지없는지 확인용
	private int mem_coupon_null;
	
	//조회용
	private String search;   	private String keyword;
	private String pageNum;  
	private int start;
	private int end;
}
