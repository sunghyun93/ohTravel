package com.oracle.ohTravel.review.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.oracle.ohTravel.review.dao.ReviewDAO;
import com.oracle.ohTravel.review.model.ReviewDTO;
import com.oracle.ohTravel.review.repository.ReviewRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class ReviewServiceImpl implements ReviewService {

	private final ReviewDAO rd;
	private final ReviewRepository rr;

	@Override
	public List<ReviewDTO> reviewSelect(String rv_real_id) {
		
		List<ReviewDTO> reviewList = rd.selectReview(rv_real_id);
		
		return reviewList;
	} 
	
	
}
