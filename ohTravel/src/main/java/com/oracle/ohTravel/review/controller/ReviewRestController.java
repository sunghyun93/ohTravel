package com.oracle.ohTravel.review.controller;


import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.ohTravel.review.domain.Review;
import com.oracle.ohTravel.review.model.ReviewDTO;
import com.oracle.ohTravel.review.service.ReviewService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ReviewRestController {

	private final ReviewService rs;
	
	@GetMapping(value = "/reviewList")
	public List<ReviewDTO> reviewList(Model model, String rv_real_id) {
		List<ReviewDTO> rvList = rs.reviewSelect(rv_real_id);
		model.addAttribute("reviewList", rvList);
		
		return rvList;
	}
	
	
}
