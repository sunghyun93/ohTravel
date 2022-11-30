package com.oracle.ohTravel.review.dao;

import java.util.List;

import com.oracle.ohTravel.review.model.ReviewDTO;

public interface ReviewDAO {

	List<ReviewDTO> selectReview(ReviewDTO reviewDTO);

	void updateReview(ReviewDTO reviewDTO);

}
