package com.oracle.ohTravel.ticket.domain;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.OneToOne;
import javax.persistence.Table;

//import com.oracle.ohTravel.city.domain.CityDomain;

import lombok.Data;

@Entity
@Table(name = "ticket_detail")
@Data
public class TicketDomain {
	
	@Id
	private Long 	   ticket_id;			// 티켓 코드
	
	/*
	 * @OneToOne
	 * 
	 * @JoinColumn(name = "city_id")
	 */
	//private CityDomain city;				// 도시 ID
	
	@Column(name = "ticket_name")
	private String     ticketName;			// 입장권명
	
	@Column(name = "ticket_sales_cnt")
	private Long 	   ticketSalesCnt;		// 누적 판매 개수
	
	@Column(name = "ticket_location")
	private String     ticketLocation;		// 위치
	
	@Column(name = "ticket_score")
	private BigDecimal ticketScore;			// 평점
	
	@Column(name = "ticket_due_date")
	private Date 	   ticketDueDate;		// 사용기한일
	
	@Column(name = "ticket_adult_price")
	private Long 	   ticketAdultPrice;	// 성인 가격
	
	@Column(name = "ticket_child_price")
	private Long 	   ticketChildPrice;	// 아동 가격
	
}
