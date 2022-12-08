package com.oracle.ohTravel.pkage.model;

import java.util.Comparator;

//높은 가격 순 정렬일 때, 패키지 상품은 정렬이 되서 오는데, 패키지의 최소가격은 정렬이 안되기 때문에 직접 자바에서 정렬해준 것.
public class MinPriceHighOrderComp implements Comparator<PkageDTORM> {
	@Override
	public int compare(PkageDTORM o1, PkageDTORM o2) {
		
		return o2.getMinPrice() - o1.getMinPrice();
	}
}
