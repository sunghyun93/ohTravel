package com.oracle.ohTravel.basket.model;

import lombok.Data;

@Data
public class BasketDTO {
	private int basket_id;
	private String mem_id; 
	private String basket_ref_id;
	private String selected_id;
}
