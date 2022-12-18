package com.oracle.ohTravel.search.model;

import java.util.Date;

import lombok.Data;

@Data
public class SearchDTO {
	private String search_word;
	private int search_count;
	private Date search_time;
}
