package com.oracle.ohTravel.member.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PackageReservationDTO {
	private int pkage_rv_id;
	private String mem_id;
	private int pkage_rv_Acnt;
	private int pkage_rv_Ccnt;
	private int pkage_rv_tprice;
	private Timestamp pkage_rv_date;
	private int pkage_rv_status;
	
	private String pkage_dt_name;
	
	private String pageNum;  
	private int start;
	private int end;
}
