package com.oracle.ohTravel.member.model;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class TicketReservationDTO {
	private int ticket_order_id;
	private String ticket_id;
	private String mem_id;
	private String ticket_name;
	private Timestamp ticket_puchase_date;
	private Date ticket_admission_date;
	private int ticket_adult_per;
	private int titicket_idcket_child_per;
	private int ticket_total_price;
	
	private String pageNum;  
	private int start;
	private int end;
}