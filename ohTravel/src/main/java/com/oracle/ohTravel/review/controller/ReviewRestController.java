package com.oracle.ohTravel.review.controller;


import org.springframework.web.bind.annotation.RestController;

import com.oracle.ohTravel.review.service.ReviewService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ReviewRestController {

	private final ReviewService rs;
	
	
	
}
