package com.oracle.ohTravel.ticket.model;

import java.util.Date;

import lombok.Data;

@Data
public class TicketModel {
	private int ticket_id;
	private int city;
	private String ticket_name;
	private int ticket_sales_cnt;
	private String ticket_location;
	private double ticket_score;
	private Date ticket_due_date;
	private int ticket_adult_price;
	private int ticket_chile_price;
	
	private String ticket_rep_img_path;
	private String ticket_detail_img_path;
}
