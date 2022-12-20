package com.oracle.ohTravel.search.service;

import java.util.Comparator;

import com.oracle.ohTravel.hotel.model.HotelDTO;

public class HotelRowPriceComparator implements Comparator<Object> {

	@Override
	public int compare(Object o1, Object o2) {
		HotelDTO hotelDTO1;
		HotelDTO hotelDTO2;

		if(o1 instanceof HotelDTO) {
			hotelDTO1 = (HotelDTO)o1;
			hotelDTO2 = (HotelDTO)o2;
			
			// 양수 (오름차순) 음수 (내림차순)
			return (int) ((hotelDTO1.getRoom_min_price() - hotelDTO2.getRoom_min_price()));
		}
		return 0;
	}
	
}