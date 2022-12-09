package com.oracle.ohTravel.member.model;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class HotelReservationDTO {
	private int h_rev_id;
	private String mem_id;
	private int room_detail_id;
	private Timestamp rev_start;
	private Timestamp rev_end;
	private String rev_stat;
	private int rev_per;
	private Date rev_date;
	private int rev_tot_price;
	
	private String room_name;
	private String hotel_kor;
	
	private String pageNum;  
	private int start;
	private int end;
	
}
