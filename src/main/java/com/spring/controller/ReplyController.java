package com.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.BoardDTO;
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
	public void replyRegister(ReplyDTO replyDTO,BoardDTO boardDTO) {
		service.register(replyDTO);
		service.PlusWriter(boardDTO);
		

		
	}
	

}
