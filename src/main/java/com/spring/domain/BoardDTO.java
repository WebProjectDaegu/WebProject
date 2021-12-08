package com.spring.domain;

import javax.swing.border.TitledBorder;

import lombok.Data;
import lombok.Setter;
import lombok.Getter;

@Data
@Getter
@Setter
public class BoardDTO {
	private long bbno;
	private String writedate;
	private String title;
	private String writer;
	private String content;
	private long membern;//작성자 회원번호
	private String name;//축제이름(타입이리뷰일때)
	private String location;//지역분류
	private String type;//게시판 타입(자유,리뷰)
	private long visiter;//조회수
	private long replyer;//댓글수
	
}
