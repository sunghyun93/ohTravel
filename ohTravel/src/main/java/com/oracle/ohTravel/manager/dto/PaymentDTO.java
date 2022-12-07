package com.oracle.ohTravel.manager.dto;

import lombok.Data;

@Data
public class PaymentDTO {
	private int payment_id;
	private String mem_id;
	private int reservation_id; //항공 예매번호
	private int h_rev_id; //숙박 예약 번호
	private int pkage_rv_id; //패키지 예매번호
	private int ticket_order_id; //티켓 상세코드
	private int ticket_id; // 티켓 코드
	private int payment_method; // 결제종류(카드,가상계좌)
	
	
}
