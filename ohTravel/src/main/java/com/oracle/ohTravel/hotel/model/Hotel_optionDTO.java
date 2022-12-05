package com.oracle.ohTravel.hotel.model;

import lombok.Data;

@Data
public class Hotel_optionDTO {
	private Integer option_id;
	private String hotel_id;
	private String hotel_option;
	private String option_gubun;
	private String hotel_exist;
}
