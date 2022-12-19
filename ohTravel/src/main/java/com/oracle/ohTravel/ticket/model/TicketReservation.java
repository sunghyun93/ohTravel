package com.oracle.ohTravel.ticket.model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TicketReservation {
	private Integer 	  ticket_order_id;
	private String 		  ticket_id;
	private String		  mem_id;
	
	private String 		  ticket_name;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date		  ticket_puchase_date;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date     ticket_admission_date;
	
	private Integer 	  ticket_adult_per;
	private Integer 	  ticket_child_per;	// ERD에서 ticket_child_per로 수정되면 수정할 예정.
	private Integer 	  ticket_total_price;
}
