package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean  prev,next;
	
	private int total; 
	private Criteria cri;
	
	
	
	public PageDTO(int total, Criteria cri) {
		this.total = total;
		this.cri = cri;
		
		
		endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		startPage = endPage-9;
		
		int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		
		if(realEnd<= this.endPage) {
			this.endPage = realEnd;
		}
		
		prev = startPage >1;
		next = endPage<realEnd;
	}
	
	
	
	
	
	
	
	
}
