package com.oracle.ohTravel.member.model;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
	private String mem_id;
	private String mem_password;
	private String mem_email;
	private String mem_tel;
	private Date mem_birthday;
	private Date mem_create;
	private String mem_role;
}
