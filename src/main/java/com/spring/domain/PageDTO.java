package com.spring.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Data
@ToString
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean  prev,next;
	private int realEnd;
	
	private int total; 
	private int pageNum = 1;
	private int amount =  10;
	private String searchtype;
	private String keyword;
	
	public String[] getSearchTypeArr() {
		return searchtype==null?new String[]{}:searchtype.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.amount)
				.queryParam("type", this.searchtype)
				.queryParam("keyword", this.keyword);
		return builder.toUriString();
	}
	public PageDTO() {
		
	}
	
	
	public void pagemaker(int total) {
		this.total = total;
		
		
		endPage = (int)(Math.ceil(pageNum/10.0))*10;
		startPage = endPage-9;
		
		realEnd = (int)(Math.ceil((total*1.0)/amount));
		
		if(realEnd<= this.endPage) {
			this.endPage = realEnd;
		}
		
		prev = startPage >1;
		next = endPage<realEnd;
	}
	
	
	
	
	
	
	
	
}
