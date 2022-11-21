package com.oracle.ohTravel.country.domain;

import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Table(name = "country")
public class CountryDomain {
	@Id
	private Long country_id;
	
	private String country_name;
}
