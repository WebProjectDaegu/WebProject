package com.spring.domain;

import java.sql.Date;

import javax.swing.border.TitledBorder;

import lombok.Data;
import lombok.Setter;
import lombok.Getter;

@Data
@Getter
@Setter
public class BoardDTO {
	private long bbno;//번호
	private Date writedate;//작성날짜
	private String title ="";//제목
	private String writer ="";//작성자
	private String content="";//내용
	private long membern = 0;//작성자 회원번호
	private String name="";//축제이름(타입이리뷰일때)
	private String location="";//지역분류
	private String type="";//게시판 타입(자유,리뷰)
	private long visiter=0;//조회수
	private long replyer=0;//댓글수
	
}
