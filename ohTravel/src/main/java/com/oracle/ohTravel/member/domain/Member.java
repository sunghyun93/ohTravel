package com.oracle.ohTravel.member.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Entity
@Data
public class Member{
	@Id
	private String mem_id;
	private String mem_name;
	private String mem_password;
	private String mem_email;
	private String mem_tel;
	private Date mem_birthday;
	private Date mem_create;
	private String mem_role;
}
