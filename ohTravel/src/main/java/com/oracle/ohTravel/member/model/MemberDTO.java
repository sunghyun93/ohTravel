package com.oracle.ohTravel.member.model;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.oracle.ohTravel.manager.model.CouponDTO;

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
  
	
//	회원 등급 관련 컬럼
	// mem_membership
	private Integer membership_id;		// 회원 등급 ID
	private Integer mem_mile;			// 마일리지
	
	// membership
	private String membership_name;			// 회원등급이름
	private Integer membership_discount;	// 할인율
	
// 회원이 가진 쿠폰 (사용기간이 지나지 않은 것만 가져옴)
	private List<CouponDTO> couponList;
  
}
