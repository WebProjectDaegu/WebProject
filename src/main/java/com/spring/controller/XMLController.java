package com.spring.controller;

import static org.hamcrest.CoreMatchers.allOf;

import java.io.IOException;
import java.io.WriteAbortedException;

import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.NodeList;

import com.spring.service.ReadFestival;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/board/*")
public class XMLController {
	
	@GetMapping("/write")
	public void WriteAbortedException() {
		
	}
	
	@GetMapping("/getFestival")
	public void getXML(Model model ) throws IOException, ParseException {
		
		ReadFestival a = new ReadFestival();
		


		

	}
	@GetMapping("/list")
	public void list() {
		
		
	}
	
	
	
	
}
