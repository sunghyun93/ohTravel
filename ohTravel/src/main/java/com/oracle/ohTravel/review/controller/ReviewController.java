package com.oracle.ohTravel.review.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.oracle.ohTravel.review.model.ReviewDTO;
import com.oracle.ohTravel.review.service.ReviewService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ReviewController {

	private final ReviewService rs;
	
	
}
