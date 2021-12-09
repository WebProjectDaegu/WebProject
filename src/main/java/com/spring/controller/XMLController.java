package com.spring.controller;

import static org.hamcrest.CoreMatchers.allOf;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.IOException;
import java.io.WriteAbortedException;

import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.NodeList;

import com.spring.domain.BoardDTO;
import com.spring.domain.FestivalDTO;
import com.spring.service.BoardService;
import com.spring.service.NoticeService;
import com.spring.service.ReadFestival;
import com.spring.service.XMLService;
import com.spring.service.XMLServiceimpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/*")
public class XMLController {
	@Autowired
	XMLService service;
	@Autowired
	BoardService boardservice;
	@Autowired
	NoticeService noticeService;

	@GetMapping("/write")
	public void WriteAbortedException() {

	}

	@GetMapping("/getFestival")
	public void getXML(Model model) throws IOException, ParseException {

		ReadFestival a = new ReadFestival();

	}

	@GetMapping("/listXML")
	public void list(Model model) {
		log.info(service.getList());
		model.addAttribute("XML", service.getList());
	}

	@GetMapping("detail")
	public void festivalDetail(@RequestParam("name") String name, Model model) {
		model.addAttribute("xml", service.getDetail(name));

	}

	@GetMapping("/notice")
	public void notice(Model model) {
		model.addAttribute("board",noticeService.getlist());
	}

	
	
	
	@GetMapping("/review")
	public void review() {

	}
	@GetMapping("/reviewlist")
	public void getreviewlist(Model model,BoardDTO boardDTO) {
		log.info(boardDTO.getLocation());
		model.addAttribute("board",boardDTO);
		log.info(boardservice.getreviewWithlocation(boardDTO));
		model.addAttribute("boardlist",boardservice.getreviewWithlocation(boardDTO));
	}
	@GetMapping("/reviewwrite")
	public void reviewwrite(Model model,BoardDTO boardDTO) {
		model.addAttribute("board",boardDTO);
		
	}
	
	
	
	
	@GetMapping("/festival")
	public void festival() {

	}
	@GetMapping("/festivallist")
	public void festivallist(Model model,FestivalDTO festivalDTO,@RequestParam("location")String location) {
		model.addAttribute("location",location);
		model.addAttribute("board",service.getListwithlocation(festivalDTO));
		
	}
	
	
	
	
	
	@GetMapping("/free")
	public void free(Model model) {
		log.info(boardservice.getBoardwithBoard("자유"));
		model.addAttribute("board",boardservice.getBoardwithBoard("자유"));
		
	}
	@GetMapping("/freewrite")
	public void freewrite(Model model,BoardDTO boardDTO) {
		model.addAttribute("board",boardDTO);
		
	}
	
	

}
