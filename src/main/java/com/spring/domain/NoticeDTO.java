package com.spring.domain;

import java.sql.Date;
import java.text.SimpleDateFormat;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class NoticeDTO {
	private long nno;
	private long replyer;
	private long visiter;
	private String title;
	private Date writedate;
	private String content;
	private String writer;

		
}
