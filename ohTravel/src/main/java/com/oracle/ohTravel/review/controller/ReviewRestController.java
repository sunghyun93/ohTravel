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
	
	@GetMapping(value = "/reviewList")
	public List<ReviewDTO> reviewList(ReviewDTO reviewDTO) {
		return rs.reviewSelect(reviewDTO);
	}
	
	@PostMapping(value = "/writeReview")
	public String writeReview(Review review) {
		return rs.writeReview(review);
	}
}
