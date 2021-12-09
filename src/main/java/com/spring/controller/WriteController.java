package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.BoardDTO;
import com.spring.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/write/*")
public class WriteController {
	@Autowired
	BoardService service;
	@PostMapping("/reviewConfirm")
	public String reviewConfrim(Model model,BoardDTO boardDTO) {
		log.info(boardDTO.getLocation());
		service.RegisterBoard(boardDTO);
		
		String locationa = boardDTO.getLocation();
		String loca ="redirect:/reviewlist?location=";
				loca = loca.concat(locationa);
				log.info(loca);
		return loca;
	}
	@PostMapping("/freeConfirm")
	public String freeConfirm(Model model,BoardDTO boardDTO) {
		log.info(boardDTO.getLocation());
		service.RegisterBoard(boardDTO);

		return "redirect:/free";
	}
	
}
