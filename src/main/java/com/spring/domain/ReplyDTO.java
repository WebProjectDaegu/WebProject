package com.spring.domain;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Setter
@Getter
public class ReplyDTO {
	private int rno;//댓글 번호
	private int brno;//게시판번호
	private int mrno;//작성자 멤버번호
	private String writer;//작성자 이름
	private String content="";
	private Date writeDate;
	private Date confrimDate;
	

}
