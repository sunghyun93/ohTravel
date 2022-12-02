package com.oracle.ohTravel.review.service;

import java.util.List;

import com.oracle.ohTravel.review.domain.Review;
import com.oracle.ohTravel.review.model.ReviewDTO;

public interface ReviewService {

	List<ReviewDTO> reviewSelect(ReviewDTO reviewDTO);

	String writeReview(Review review);

	String updateReview(ReviewDTO reviewDTO);

	String deleteReview(Review review);
	
	double selectAvgRating(ReviewDTO reviewDTO);

}
