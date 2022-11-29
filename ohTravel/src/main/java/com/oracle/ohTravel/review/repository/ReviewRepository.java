package com.oracle.ohTravel.review.repository;

import com.oracle.ohTravel.review.domain.Review;

public interface ReviewRepository {

	void writeReview(Review review);

}
