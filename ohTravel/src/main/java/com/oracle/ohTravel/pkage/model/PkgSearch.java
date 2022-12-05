package com.oracle.ohTravel.pkage.model;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class PkgSearch {
	private String pkage_id;		// 패키지 ID
	private Integer toDesti; 		// 가고싶은 도시
	private String dates_start_check; // 출발날짜
	private Integer pkage_gubun; 	// 패키지 구분(0:국내, 1:해외)
	
	// 정렬
	private Integer order;			// 정렬 - 순서
	
	// 필터를 위한 변수들
	private String amtGubun;	// 가격 구분(최소만 있는지, 최대만 있는지, 최소 최대 모두 있는지)
	private String minAmt;		// 필터 - 최소가격
	private String maxAmt;		// 필터 - 최대가격
	private String chk_term;		// 필터 - 여행기간
	private String chk_time;		// 필터 - 출발시간(AM-05~12, PM-12~18)
	private String chk_start_time;	// 필터로 가져온 값을 변환해 DB에서 조회할 값
	private String chk_end_time;	// 필터로 가져온 값을 변환해 DB에서 조회할 값
	
	// 더미 변수
	private String country;	// 검색결과에 뿌려줄 나라 받는 변수
	
	public void makeAmtGubun() {
		if(minAmt != null && maxAmt != null) amtGubun = "3";	// 최소 최대 모두 있는지
		if(minAmt != null && maxAmt == null) amtGubun = "2";	// 최소만 있는지
		if(minAmt == null && maxAmt != null) amtGubun = "1";	// 최대만 있는지
	}
	
	public void makeDBtime() {
		if(this.chk_time != null) {
			if(this.chk_time.equals("AM")) {
				this.chk_start_time = "5";
				this.chk_end_time = "12";
			} else if(this.chk_time.equals("PM")) {
				this.chk_start_time = "12";
				this.chk_end_time = "18";
			}
		}
	}
	
	public String getQueryString(Integer order) {
		UriComponentsBuilder builder = UriComponentsBuilder.newInstance();
		
		builder
		.queryParam("toDesti", toDesti)
		.queryParam("dates_start_check", dates_start_check)
		.queryParam("pkage_gubun", pkage_gubun)
		.queryParam("order", order);
		
		if(pkage_id != null) {
			builder.queryParam("pkage_id", pkage_id);
		}
		if(minAmt != null) {
			builder.queryParam("minAmt", minAmt);
		}
		if(maxAmt != null) {
			builder.queryParam("maxAmt", maxAmt);
		}
		if(chk_term != null) {
			builder.queryParam("chk_term", chk_term);
		}
		if(chk_time != null) {
			builder.queryParam("chk_time", chk_time);
		}

		UriComponents uriComponents = builder.build();
		
		String queryString = uriComponents.toString();
		return queryString;
	}
	
//	필터 적용할 때는 이 함수를 타야 됨.. 왜이러지 ㅅㅂ;;
	public String getQueryString() {
		UriComponentsBuilder builder = UriComponentsBuilder.newInstance();
		
		builder
		.queryParam("toDesti", toDesti)
		.queryParam("dates_start_check", dates_start_check)
		.queryParam("pkage_gubun", pkage_gubun)
		.queryParam("order", order);
		
		if(pkage_id != null) {
			builder.queryParam("pkage_id", pkage_id);
		}
		
		UriComponents uriComponents = builder.build();
		
		String queryString = uriComponents.toString();
		return queryString;
	}
}
