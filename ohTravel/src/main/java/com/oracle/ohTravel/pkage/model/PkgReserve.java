package com.oracle.ohTravel.pkage.model;

import lombok.Data;

// 패키지 예약 페이지로 갈 때 사용하는 클래스
@Data
public class PkgReserve {
	private String pkage_id;
	private Integer pkage_dt_id;
	private Integer adultCnt;
	private Integer childCnt;
	private Integer totalPay;
	
	public void makeTotalPay(Integer aPrice, Integer cPrice) {
		if(this.adultCnt == null) adultCnt = 0;
		if(this.childCnt == null) childCnt = 0;
		
		this.totalPay = (this.adultCnt * aPrice) + (this.childCnt * cPrice);
	}
}
