package com.oracle.ohTravel.review.controller;


import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.ohTravel.review.domain.Review;
import com.oracle.ohTravel.review.model.ReviewDTO;
import com.oracle.ohTravel.review.service.ReviewService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/review")
public class ReviewRestController {

	private final ReviewService rs;
	
	//리뷰 목록 조회
	@GetMapping(value = "/reviewList")
	public List<ReviewDTO> reviewList(ReviewDTO reviewDTO) {
		System.out.println("getReviewList Start...");
		List<ReviewDTO> list = rs.reviewSelect(reviewDTO);
		// pkage 쪽 별점 표시 때문에 살짝 변경했습니다 (퍼센트를 구해야함..)
		for(ReviewDTO dto : list) {
			System.out.println("DB 점수"+dto.getRv_rating());
			dto.getRvPercent();
			System.out.println("퍼센트:"+dto.getRv_percent());
		}
		return list;
	}
	
	//리뷰 등록
	@PostMapping(value = "/writeReview")
	public String writeReview(Review review) {
		return rs.writeReview(review);
	}
	
	//리뷰 수정
	@PostMapping(value = "/updateReview")
	public String updateReview(ReviewDTO reviewDTO) {
		return rs.updateReview(reviewDTO);
	}
	
	//리뷰 삭제
	@PostMapping(value = "/deleteReview")
	public String deleteReview(Review review) {
		return rs.deleteReview(review);
	}
}
