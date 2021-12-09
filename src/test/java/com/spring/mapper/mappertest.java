package com.spring.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.BoardDTO;
import com.spring.domain.FestivalDTO;
import com.spring.domain.MemberDTO;

import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class mappertest {
	@Autowired
	BoardMapper mapper;
	BoardDTO boardDTO = new BoardDTO() ;
	FestivalDTO festivalDTO = new FestivalDTO();
	FestivalMapper FestivalMapper;
	@Test
	public void registerboard() {
		boardDTO.setTitle("제목");
		boardDTO.setWriter("작성자");
		boardDTO.setContent("내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용");
		boardDTO.setMembern(11);
		boardDTO.setName("김축제");
		boardDTO.setType("자유");
		mapper.registerBoard(boardDTO);
	}
	
	@Test
	public void getlist() {
		log.info(mapper.getboardwithtype("자유"));
	}
	@Test
	public void festlist() {
		festivalDTO.setLocation("경상북도");
		log.info(FestivalMapper.getlistwithlocation(festivalDTO));
	}
	
}
