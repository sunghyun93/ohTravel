package com.oracle.ohTravel.ticket.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class TicketReservation {
	private Integer 	  ticket_order_id;
	private String 		  ticket_id;
	private String		  mem_id;
	
	private String 		  ticket_name;
	private LocalDateTime ticket_purchase_date;
	private LocalDate     ticket_admission_date;
	
	private Integer 	  ticket_adult_per;
	private Integer 	  ticket_child_per;
	private Integer 	  ticket_total_price;
	
	
	
	public void makeTotalPay(int aPrice, int cPrice) {
		if(this.ticket_adult_per == null) ticket_adult_per = 0;
		if(this.ticket_child_per == null) ticket_child_per = 0;
		
		this.ticket_total_price = (this.ticket_adult_per * aPrice) + (this.ticket_child_per * cPrice);
	}
}
