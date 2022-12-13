package com.oracle.ohTravel.member.model;

import lombok.Data;

@Data
public class BasketDTO {
	private int basket_id;
	private String mem_id;
	private String basket_ref_id;
	
	// 패키지명
	private String pkage_name;
	
	// 호텔명
	private String hotel_kor;
	
	// 티켓명
	private String ticket_name;
	
	private String pk = "pk";
	private String ht = "ht";
	private String ti = "ti";
	
	private String pageNum;  
	private int start;
	private int end;
}
