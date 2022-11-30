package com.oracle.ohTravel.review.repository;

import javax.persistence.EntityManager;

import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.review.domain.Review;
import com.oracle.ohTravel.review.model.ReviewDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ReviewRepositoryImpl implements ReviewRepository {
	
	private final EntityManager em;
	
	@Override
	public void writeReview(Review review) {
		em.persist(review);
	}

	@Override
	public void deleteReview(Review review) {
		Review findReview = em.find(Review.class, 1L);
		em.remove(findReview);
	}


}
