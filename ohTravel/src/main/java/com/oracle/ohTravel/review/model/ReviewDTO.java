package com.oracle.ohTravel.review.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReviewDTO {
	
	private int rv_id;
	private String mem_id;
	private double rv_rating;
	private String rv_contents;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date rv_date;
	private String rv_real_id;
	
	//hotel
	//private double hotel_score;
	
	private String pageNum;
	private int start;
	private int end;
	private int rowPage;
	private String currentPage;
	
	// pkage 쪽 리뷰의 평점은 100분율의 값으로 별 모양이 표시가 되서 컬럼 하나 만들고 함수 만들겠습니다.
	private Integer rv_percent;
	
	public void getRvPercent() {
		rv_percent = (int)((rv_rating / 5)*100);
	}
}
