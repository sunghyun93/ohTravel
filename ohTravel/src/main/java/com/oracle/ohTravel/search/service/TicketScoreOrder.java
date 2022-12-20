package com.oracle.ohTravel.search.service;

import java.util.Comparator;

import com.oracle.ohTravel.pkage.model.PkageDTO;

public class TicketScoreOrder implements Comparator<Object> {

	@Override
	public int compare(Object o1, Object o2) {
		PkageDTO pkageDTO1;
		PkageDTO pkageDTO2;
		
		if(o1 instanceof PkageDTO) {
			pkageDTO1 = (PkageDTO)o1;
			pkageDTO2 = (PkageDTO)o2;
			
			// 양수 (오름차순) 음수 (내림차순)
			return (int) ((pkageDTO1.getPkage_score()*10 - pkageDTO2.getPkage_score()*10)*-1);
		}
		return 0;
	}

}
