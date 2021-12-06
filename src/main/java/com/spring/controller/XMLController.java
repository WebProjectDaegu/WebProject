package com.spring.controller;

import static org.hamcrest.CoreMatchers.allOf;

import java.io.IOException;
import java.io.WriteAbortedException;

import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.NodeList;

import com.spring.service.ReadFestival;
import com.spring.service.XMLService;
import com.spring.service.XMLServiceimpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/xml/*")
public class XMLController {
	@Autowired
	XMLService service;
	@GetMapping("/write")
	public void WriteAbortedException() {
		
	}
	
	@GetMapping("/getFestival")
	public void getXML(Model model ) throws IOException, ParseException {
		
		ReadFestival a = new ReadFestival();
		


		

	}
	@GetMapping("/listXML")
	public void list(Model model) {
		log.info(service.getList());
		model.addAttribute("XML",service.getList());
	}
	@GetMapping("detail")
	public void festivalDetail(@RequestParam("name") String name, Model model){
		model.addAttribute("xml",service.getDetail(name));
		
	}
	
	
	
}
