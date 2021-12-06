package com.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.sound.midi.MidiDevice.Info;

import org.json.simple.parser.ParseException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.FestivalDTO;
import com.spring.mapper.FestivalMapper;
import com.spring.service.ReadFestival;
import com.spring.service.XMLService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class XMLtest {
	@Autowired
	private FestivalMapper mapper;
	@Autowired
	XMLService service;
	@Test
	public void testa() throws IOException, ParseException {
		
		ReadFestival a = null;
		List<FestivalDTO> b = a.read();
		for(int i =0;i<b.size();i++) {
			mapper.insertFestival(b.get(i));
		}
		
		
	}
	@Test
	public void get() {
		log.info(service.getList());

		
	}
			


	

}
