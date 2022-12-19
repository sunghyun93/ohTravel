package com.oracle.ohTravel.search.service;

import java.util.Comparator;

import com.oracle.ohTravel.hotel.model.HotelDTO;
import com.oracle.ohTravel.pkage.model.PkageDTO;

public class HighPriceComparator implements Comparator<Object> {

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
			return (int) ((pkageDTO1.getMin_price() - pkageDTO2.getMin_price())*-1);
		}
		return 0;
		
//		if(o1 instanceof HotelDTO) {
//			hotelDTO1 = (HotelDTO)o1;
//			hotelDTO2 = (HotelDTO)o2;
//			
//			return (hotelDTO1.getHotel_soldCnt() - hotelDTO2.getHotel_soldCnt())*-1;
//		}
	}

}
