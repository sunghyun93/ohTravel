package com.oracle.ohTravel.airport.model;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PeopleInfo {
	
	private List<String> air_pi_name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private List<Date> air_pi_birth;
	private List<Integer> air_pi_gen;
	private List<String> air_pi_lname;
	private List<String> air_pi_fname;
	private List<Integer>  air_pi_tel;
	private List<String> air_pi_email;
	private List<String>  air_passport;
	
}
