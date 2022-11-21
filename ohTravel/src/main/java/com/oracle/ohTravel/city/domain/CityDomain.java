package com.oracle.ohTravel.city.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.oracle.ohTravel.country.domain.CountryDomain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "city")
public class CityDomain {
	
	@Id
	@Column(name = "city_id")
	private Long cityId;
	
	/*
	 * @OneToOne
	 * 
	 * @JoinColumn(name = "country_id")
	 */
	//private CountryDomain country;
	
	@Column(name = "city_name")
	private String cityName;
	
}
