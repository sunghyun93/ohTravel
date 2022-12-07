package com.oracle.ohTravel.pkage.model;

import java.util.Date;

import lombok.Data;

// 패키지 예약 인원 정보
@Data
public class Pkage_rs_piDTO {
	private Integer pkage_pi_id;	// 인원정보ID
	private Integer pkage_rv_id;	// 패키지예약ID
	private String pkage_pi_name;	// 한글성명
	private Date pkage_pi_birth;	// 생년월일
	private Integer pkage_pi_gen;	// 성별
	private String pkage_pi_lname;	// 영문성
	private String pkage_pi_fname;	// 영문이름
	private String pkage_pi_tel;	// 전화번호
	private String pkage_pi_email;	// 이메일
	
	// 패키지 예약
	private Pkage_rsDTO pkage_rsDTO;
}
