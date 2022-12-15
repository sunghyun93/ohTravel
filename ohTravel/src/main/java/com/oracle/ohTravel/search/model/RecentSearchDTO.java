package com.oracle.ohTravel.search.model;

import java.util.Date;

import lombok.Data;

@Data
public class RecentSearchDTO {
	private String search_word;
	private String mem_id;
	private Date search_time;
	private int search_count;
}
