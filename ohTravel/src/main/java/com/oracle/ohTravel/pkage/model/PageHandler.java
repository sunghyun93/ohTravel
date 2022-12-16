package com.oracle.ohTravel.pkage.model;

import lombok.Data;

@Data
public class PageHandler {
//	private Integer page;		// 현재 페이지
//	private Integer pageSize;	// 페이지당 content 수
	private PkgSearch pkgSearch; // page, pageSize 를 가지고 있음
	private int totalCnt;	// 총 content 수
	private int naviSize;	// 페이지 네비게이션 크기
	private int totalPage;	// 총 페이지 수
	private int beginPage;	// 페이지 네비게이션 시작 번호
	private int endPage;	// 페이지 네비게이션 끝 번호
	private boolean	showPrev;	// 페이지 네비게이션 이전 여부
	private boolean showNext;	// 페이지 네비게이션 다음 여부
	
	public PageHandler(PkgSearch pkgSearch, int totalCnt, int naviSize) {
		this.pkgSearch = pkgSearch;
		this.totalCnt = totalCnt;
		this.naviSize = naviSize;

		totalPage = (int)Math.ceil((double)totalCnt / pkgSearch.getPageSize());
		beginPage = (pkgSearch.getPage()-1) / naviSize * naviSize + 1;
		endPage = (beginPage + naviSize - 1) > totalPage ? totalPage : (beginPage + naviSize - 1);
		showPrev = beginPage != 1;
		showNext = endPage != totalPage;
	}
}
