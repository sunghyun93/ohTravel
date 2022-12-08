package com.oracle.ohTravel.pkage.model;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

// 패키지 예약 시 받을 값을 위한 클래스
@Data
public class PkgReserveEle {
	private String pkage_id; 			// 패키지 ID - 판매 개수 올리는 용도
	private Integer pkage_dt_id; 		// 패키지 상세 ID
	private Integer pkage_rv_Acnt; 		// 성인 인원
	private Integer pkage_rv_Ccnt;		// 아동 인원
	private Integer pkage_rv_tprice;	// 총 가격
	private Integer	coupon_id;			// 적용한 쿠폰 ID - 쿠폰 사용 시 사용여부 변경을 위함
	private Integer mile;				// 적용할 마일리지 - 회원에게 마일리지 적용

	// 패키지 예약 완료 후 예약 완료 페이지로 전달하기 위한 변수
	private Integer pkage_rv_id;		// 예약번호
	
	
	// 여행자 정보
	private List<String> pkage_pi_name;		// 한글성명
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private List<Date> pkage_pi_birth;	// 생년월일
	private List<Integer> pkage_pi_gen;		// 성별 (0:남자, 1:여자)
	private List<String> pkage_pi_lname;	// 영문성
	private List<String> pkage_pi_fname;	// 영문이름
	private List<String> pkage_pi_email;	// 이메일 (0 이 들어오면 아동인 경우임)
	private List<String> pkage_pi_tel;		// 전화번호 (0 이 들어오면 아동인 경우임)	

}
