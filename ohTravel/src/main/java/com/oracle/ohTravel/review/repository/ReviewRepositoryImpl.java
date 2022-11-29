package com.oracle.ohTravel.review.repository;

import javax.persistence.EntityManager;

import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.review.domain.Review;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ReviewRepositoryImpl implements ReviewRepository {
	
	private final EntityManager em;
	
	@Override
	public void writeReview(Review review) {
		em.persist(review);
	}

}
