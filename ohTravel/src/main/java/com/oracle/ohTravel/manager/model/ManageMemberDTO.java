package com.oracle.ohTravel.manager.model;

import java.sql.Date;

import lombok.Data;

@Data
public class ManageMemberDTO {
	private String mem_id;
	private String mem_name;
	private String mem_password;
	private String mem_email;
	private String mem_tel;
	private Date mem_birthday;
	private Date mem_create;
	private String mem_role;
	
	
	
	//조회용
	private String search;   	private String keyword;
	private String pageNum;  
	private int start;
	private int end;
	
}
