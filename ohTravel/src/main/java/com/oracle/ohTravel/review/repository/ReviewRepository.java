package com.oracle.ohTravel.review.repository;

import com.oracle.ohTravel.review.domain.Review;
import com.oracle.ohTravel.review.model.ReviewDTO;

public interface ReviewRepository {

	void writeReview(Review review);


}
