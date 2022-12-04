package com.oracle.ohTravel.pkage.model;

import lombok.Data;

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
