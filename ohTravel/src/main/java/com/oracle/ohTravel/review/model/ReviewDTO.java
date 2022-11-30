package com.oracle.ohTravel.review.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReviewDTO {
	
	private int rv_id;
	private String mem_id;
	private Double rv_rating;
	private String rv_sort;
	private String rv_contents;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date rv_date;
	private String rv_real_id;
}
