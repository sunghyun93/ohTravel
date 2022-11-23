package com.oracle.ohTravel.review.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.oracle.ohTravel.review.repository.ReviewRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class ReviewServiceImpl implements ReviewService {

	private final ReviewRepository rr;
	
	
}
