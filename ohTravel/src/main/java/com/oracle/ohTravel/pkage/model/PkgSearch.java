package com.oracle.ohTravel.pkage.model;

import lombok.Data;

@Data
public class PkgSearch {
	private Integer toDesti; // 가고싶은 나라
	private String dates_start_check; // 출발날짜
	private Integer pkage_gubun; 	// 패키지 구분(0:국내, 1:해외)
	
}
