package com.oracle.ohTravel.member.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemCouponDTO {
	// mem_coupon
	private String mem_id;
	private int coupon_id;
	private Timestamp coupon_down;
	private int coupon_use;
	private Timestamp coupon_limit_date;
	
	private String coupon_name;
}
