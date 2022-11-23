package com.oracle.ohTravel.review.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	
	private int rv_id;
	private String mem_id;
	private String rv_sort;
	private String rv_contents;
	private Date rv_Date;
	private String rv_real_id;
}
