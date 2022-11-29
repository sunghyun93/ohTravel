package com.oracle.ohTravel.review.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import lombok.Data;

@Entity
@Data
public class Review {

	@Id
	private int rv_id;
	private String mem_id;
	private Double rv_rating;
	private String rv_sort;
	private String rv_contents;
	private Date rv_date;
	private String rv_real_id;
	
}