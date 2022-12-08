package com.oracle.ohTravel.pkage.model;

import java.util.Date;
import java.util.List;

import com.oracle.ohTravel.member.model.MemberDTO;

import lombok.Data;

// 패키지예약
@Data
public class Pkage_rsDTO {
	private Integer pkage_rv_id;		// 패키지 예약ID
	private Integer pkage_dt_id;		// 패키지 상세ID
	private String mem_id;				// 아이디
	private Integer pkage_rv_Acnt;		// 성인인원
	private Integer pkage_rv_Ccnt;		// 아동인원
	private Integer pkage_rv_tprice;	// 총 가격
	private Date pkage_rv_date;			// 예약일자
	private Integer pkage_rv_status;	// 예약상태 (0:예약전, 1:예약완료)
	
	// 패키지 예약 인원 정보 
	private List<Pkage_rs_piDTO> Pkage_rs_piDTOList;
	
	// 패키지 상세
	private Pkage_detailDTO pkage_detailDTO;
	
	// 회원
	private MemberDTO memberDTO;
}
