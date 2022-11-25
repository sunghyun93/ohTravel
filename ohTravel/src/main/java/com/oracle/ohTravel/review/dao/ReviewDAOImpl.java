package com.oracle.ohTravel.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.review.model.ReviewDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ReviewDAOImpl implements ReviewDAO {

	private final SqlSession session;
	
	
	@Override
	public List<ReviewDTO> selectReview(String rv_real_id) {

		List<ReviewDTO> reviewList = session.selectList("reviewList");
		
		return reviewList;
	}

}
