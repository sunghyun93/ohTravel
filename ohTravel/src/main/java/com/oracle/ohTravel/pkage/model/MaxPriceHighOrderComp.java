package com.oracle.ohTravel.pkage.model;

import java.util.Comparator;

public class MaxPriceHighOrderComp implements Comparator<PkageDTORM> {

	@Override
	public int compare(PkageDTORM o1, PkageDTORM o2) {
		return o1.getMinPrice() - o2.getMinPrice();
	}

}
