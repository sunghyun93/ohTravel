package com.oracle.ohTravel.review.service;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.oracle.ohTravel.review.dao.ReviewDAO;
import com.oracle.ohTravel.review.domain.Review;
import com.oracle.ohTravel.review.model.ReviewDTO;
import com.oracle.ohTravel.review.repository.ReviewRepository;

import ch.qos.logback.classic.Logger;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Transactional
@Slf4j
public class ReviewServiceImpl implements ReviewService {

	private final ReviewDAO rd;
	private final ReviewRepository rr;

	
	@Override
	public List<ReviewDTO> reviewSelect(ReviewDTO reviewDTO) {
		return rd.selectReview(reviewDTO);
	}


	@Override
	public String writeReview(Review review) {
		
		try {
			review.setRv_date(new Date());
			rr.writeReview(review);
			
		} catch (Exception e) {
			log.debug(e.getMessage());
			return "FAIL";
			
		}
		
		return "SUCCESS";
	}

	@Override
	public String updateReview(ReviewDTO reviewDTO) {
		
		try {
			
			rd.updateReview(reviewDTO);
			
		} catch (Exception e) {
			log.debug(e.getMessage());
			return "FAIL";
			
		}
		
		return "SUCCESS";
	}
	
}
