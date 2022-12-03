package com.oracle.ohTravel.review.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.hotel.service.HotelService;
import com.oracle.ohTravel.review.domain.Review;
import com.oracle.ohTravel.review.model.ReviewDTO;
import com.oracle.ohTravel.review.model.ReviewPaging;
import com.oracle.ohTravel.review.service.ReviewService;
import com.oracle.ohTravel.search.service.Paging;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/review")
public class ReviewRestController {

	private final ReviewService rs;
	
	//리뷰 목록 조회
	@GetMapping(value = "/reviewList")

	public Map<String,Object> reviewList(ReviewDTO reviewDTO) {
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		int totalReviewCnt = rs.totalReviewCnt(reviewDTO.getRv_real_id());
		
		ReviewPaging page = new ReviewPaging(totalReviewCnt, reviewDTO.getCurrentPage());
		
		reviewDTO.setStart(page.getStart());
		reviewDTO.setRowPage(page.getRowPage());
		
		resultMap.put("reviewList", rs.reviewSelect(reviewDTO));
		
		List<ReviewDTO> list = (List<ReviewDTO>)resultMap.get("reviewList");
		// pkage 쪽 별점 표시 때문에 살짝 변경했습니다 (퍼센트를 구해야함..)
		for(ReviewDTO dto : list) {
			dto.getRvPercent();
		}
		
		//평점 가져오는 메서드
		resultMap.put("avgScore", rs.selectAvgRating(reviewDTO));
		
		resultMap.put("page", page);
		
		return resultMap;

	}
	
	//리뷰 등록
	@PostMapping(value = "/writeReview")
	public String writeReview(Review review) {
		return rs.writeReview(review);
	}
	
	//리뷰 수정
	@PostMapping(value = "/updateReview")
	public String updateReview(ReviewDTO reviewDTO) {
		return rs.updateReview(reviewDTO);
	}
	
	//리뷰 삭제
	@PostMapping(value = "/deleteReview")
	public String deleteReview(Review review) {
		return rs.deleteReview(review);
	}
}
