package com.oracle.ohTravel.manager.model;

import java.sql.Date;

import lombok.Data;

@Data
public class MembershipDTO {
	//Membership테이블용
	private int membership_id;
	private String membership_name;
	private int membership_mile;
	private int membership_discount;
	
	//Membership과 member테이블 조인된 mem_membership테이블용
	private String mem_id;
	private int mem_mile;
	
	//Membership과 member테이블 조인될때 Member테이블에 있는 컬럼
	private String mem_name;
	private String mem_password;
	private String mem_email;
	private String mem_tel;
	private Date mem_birthday;
	private Date mem_create;
}
