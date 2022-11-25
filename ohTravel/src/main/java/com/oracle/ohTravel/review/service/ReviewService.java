package com.oracle.ohTravel.review.service;

import java.util.List;

import com.oracle.ohTravel.review.model.ReviewDTO;

public interface ReviewService {

	List<ReviewDTO> reviewSelect(String rv_real_id);

}
