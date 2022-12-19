package com.oracle.ohTravel.airport.model;

import java.util.Date;

import lombok.Data;

@Data
public class Air_Reservation_PiDTO {
	private Integer air_pi_id; //인원정보 ID
	private int reservation_id; // 예매번호 ID
	private String air_pi_name; // 한글성명
	private Date  air_pi_birth; // 생년월일
	private int  air_pi_gen; // 0은 남자 1은 여자
	private String  air_pi_lname; // 영문 성
	private String  air_pi_fname; //영문이름
	private int  air_pi_tel; //전화번호
	private String  air_pi_email; //이메일
	private String  air_passport; //여권번호
	
}
