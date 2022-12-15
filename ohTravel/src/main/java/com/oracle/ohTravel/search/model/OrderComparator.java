package com.oracle.ohTravel.search.model;

import java.util.Comparator;

import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.pkage.model.PkageDTO;

// 구매순 Comparator
public class OrderComparator implements Comparator<Object> {

	@Override
	public int compare(Object o1, Object o2) {
		PkageDTO pkageDTO1;
		PkageDTO pkageDTO2;
		HotelDTO hotelDTO1;
		HotelDTO hotelDTO2;
		
		if(o1 instanceof PkageDTO) {
			pkageDTO1 = (PkageDTO)o1;
			pkageDTO2 = (PkageDTO)o2;
			
			// 양수 (오름차순) 음수 (내림차순)
			return (pkageDTO1.getPkage_soldCnt() - pkageDTO2.getPkage_soldCnt())*-1;
		}
		return 0;
	}

}
