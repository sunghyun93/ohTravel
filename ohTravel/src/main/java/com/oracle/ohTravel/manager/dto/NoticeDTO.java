package com.oracle.ohTravel.manager.dto;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class NoticeDTO {
	private int notice_id;
	private String notice_title;
	private String notice_content;
	private String notice_writer;
	private Timestamp notice_write_date;
	private int notice_count;
}


