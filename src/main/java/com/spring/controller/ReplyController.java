package com.spring.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.BoardDTO;
import com.spring.domain.PageDTO;
import com.spring.domain.ReplyDTO;
import com.spring.service.ReplyService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/reply")
public class ReplyController {
	@Autowired
	ReplyService service;
	@PostMapping("/register")
	public String replyRegister(ReplyDTO replyDTO,BoardDTO boardDTO,PageDTO pageDTO) throws UnsupportedEncodingException {
		service.register(replyDTO);
		service.PlusWriter(boardDTO);
		
		String loca ="redirect:/detail?keyword="+URLEncoder.encode(pageDTO.getKeyword(), "UTF-8");
		loca +="&searchtype="+URLEncoder.encode(pageDTO.getSearchtype(), "UTF-8");
		loca +="&pageNum="+URLEncoder.encode(Integer.toString(pageDTO.getPageNum()), "UTF-8");
		loca +="&location="+URLEncoder.encode(boardDTO.getLocation(), "UTF-8");
		loca +="&bbno="+URLEncoder.encode(Integer.toString(boardDTO.getBbno()), "UTF-8");
		loca +="&type="+URLEncoder.encode(boardDTO.getType(), "UTF-8");
		
		return loca;
		
		
		
		
	}
	@PostMapping("/delete")
	public String DeleteReply(ReplyDTO replyDTO,BoardDTO boardDTO,PageDTO pageDTO) throws UnsupportedEncodingException {
		
		service.delete(replyDTO);
		service.MinusWriter(boardDTO);
	
		String loca ="redirect:/detail?keyword="+URLEncoder.encode(pageDTO.getKeyword(), "UTF-8");
		loca +="&searchtype="+URLEncoder.encode(pageDTO.getSearchtype(), "UTF-8");
		loca +="&pageNum="+URLEncoder.encode(Integer.toString(pageDTO.getPageNum()), "UTF-8");
		loca +="&location="+URLEncoder.encode(boardDTO.getLocation(), "UTF-8");
		loca +="&bbno="+URLEncoder.encode(Integer.toString(boardDTO.getBbno()), "UTF-8");
		loca +="&type="+URLEncoder.encode(boardDTO.getType(), "UTF-8");
		return loca;
	}
	@PostMapping("rewrite")
public String rewriteReply(ReplyDTO replyDTO,BoardDTO boardDTO,PageDTO pageDTO) throws UnsupportedEncodingException {
		
		service.rewrite(replyDTO);
	
		String loca ="redirect:/detail?keyword="+URLEncoder.encode(pageDTO.getKeyword(), "UTF-8");
		loca +="&searchtype="+URLEncoder.encode(pageDTO.getSearchtype(), "UTF-8");
		loca +="&pageNum="+URLEncoder.encode(Integer.toString(pageDTO.getPageNum()), "UTF-8");
		loca +="&location="+URLEncoder.encode(boardDTO.getLocation(), "UTF-8");
		loca +="&bbno="+URLEncoder.encode(Integer.toString(boardDTO.getBbno()), "UTF-8");
		loca +="&type="+URLEncoder.encode(boardDTO.getType(), "UTF-8");
		return loca;
	}
	

}
