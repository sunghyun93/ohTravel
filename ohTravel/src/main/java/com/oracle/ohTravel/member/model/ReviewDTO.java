package com.oracle.ohTravel.member.model;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	private int rv_id;
	private String mem_id;
	private float rv_rating;
	private String rv_contents;
	private Date rv_date;
	private String rv_real_id;
	
	private String pk = "pk";
	private String ht = "ht";
	private String ti = "ti";
	
	private String pageNum;  
	private int start;
	private int end;
}
