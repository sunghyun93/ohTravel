package com.oracle.ohTravel.member.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberDTO {
	// member
	private String mem_id;
	private String mem_name;
	private String mem_password;
	private String mem_email;
	private String mem_tel;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date mem_birthday;
	private Date mem_create;
	private String mem_role;
	
	// mem_membership
	private int membership_id;
	private int mem_mile;
}
