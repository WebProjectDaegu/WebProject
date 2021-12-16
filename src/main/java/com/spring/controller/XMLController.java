package com.spring.controller;

import static org.hamcrest.CoreMatchers.allOf;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.IOException;
import java.io.WriteAbortedException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Mapper;
import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.NodeList;

import com.spring.domain.BoardDTO;
import com.spring.domain.FestivalDTO;
import com.spring.domain.PageDTO;
import com.spring.service.BoardService;
import com.spring.service.ReadFestival;
import com.spring.service.ReplyService;
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
	ReplyService replyService;

	@GetMapping("/write")
	public void WriteAbortedException() {

	}

	@GetMapping("/notice")
	public void notice(Model model, PageDTO pageDTO, BoardDTO boardDTO) {
		boardDTO.setType("공지");
		pageDTO.pagemaker(boardservice.gettotal(boardDTO, pageDTO));
		log.info(pageDTO);
		log.info(boardDTO);
		log.info(boardservice.getBoardwithBoard(boardDTO, pageDTO));

		model.addAttribute("page", pageDTO);
		model.addAttribute("board0", boardDTO);
		model.addAttribute("board", boardservice.getBoardwithBoard(boardDTO, pageDTO));
	}

	@GetMapping("/noticewrite")
	public void noticewrite() {

	}

	@GetMapping("/review")
	public void review() {

	}

	@GetMapping("/reviewlist")
	public void getreviewlist(Model model, BoardDTO boardDTO, PageDTO pageDTO) {
		pageDTO.pagemaker(boardservice.gettotal(boardDTO, pageDTO));
		boardDTO.setType("리뷰");
		boardDTO.setLocation(boardDTO.getLocation());
		model.addAttribute("board0", boardDTO);
		model.addAttribute("page", pageDTO);
		log.info(boardDTO);
		log.info(pageDTO);
		model.addAttribute("boardlist", boardservice.getBoardwithBoard(boardDTO, pageDTO));
	}

	@GetMapping("/reviewwrite")
	public void reviewwrite(Model model, BoardDTO boardDTO) {
		model.addAttribute("board", boardDTO);

	}

	@GetMapping("/festival")
	public void festival() {

	}

	@GetMapping("/festivallist")
	public void festivallist(Model model, FestivalDTO festivalDTO, PageDTO pageDTO) {
		pageDTO.setAmount(20);
		pageDTO.pagemaker(service.gettotal(festivalDTO, pageDTO));
		model.addAttribute("board0", festivalDTO);
		model.addAttribute("page", pageDTO);
		log.info(festivalDTO);
		log.info(pageDTO);
		model.addAttribute("boards", service.getListwithlocation(festivalDTO, pageDTO));

	}

	@GetMapping("/festivalDetail")
	public void festivalDetail(Model model, FestivalDTO festivalDTO, PageDTO pageDTO) {
		service.PlusVisiter(festivalDTO);
		model.addAttribute("page", pageDTO);
		model.addAttribute("board", service.getdetail(festivalDTO));
	}

	@GetMapping("/free")
	public void free(Model model, PageDTO pageDTO, BoardDTO boardDTO) {
		boardDTO.setType("자유");
		pageDTO.pagemaker(boardservice.gettotal(boardDTO, pageDTO));
		log.info(pageDTO);
		log.info(boardDTO);
		model.addAttribute("page", pageDTO);
		model.addAttribute("board0", boardDTO);
		model.addAttribute("board", boardservice.getBoardwithBoard(boardDTO, pageDTO));

	}

	@GetMapping("/freewrite")
	public void freewrite(Model model, BoardDTO boardDTO) {
		model.addAttribute("board", boardDTO);

	}

	@GetMapping("/detail")
	public void freeDetail(HttpServletRequest request, HttpServletResponse response, Model model, BoardDTO boardDTO,
			PageDTO pageDTO) {
//		boolean havecookie = false;
//		Cookie[] getCookie = request.getCookies(); // 모든 쿠키 가져오기
//		if (getCookie != null) { // 만약 쿠키가 없으면 쿠키 생성
//			for (int i = 0; i < getCookie.length; i++) {
//				Cookie c = getCookie[i]; // 객체 생성
//				if (c.getName() == Integer.toString(boardDTO.getBbno())) {
//					havecookie = true;
//					break;
//				}
//			}
//		} 
//		else {
//			Cookie setCookie = new Cookie(Integer.toString(boardDTO.getBbno()), Integer.toString(boardDTO.getBbno())); // 쿠키
//			setCookie.setMaxAge(60 * 60 * 24); // 기간을 하루로 지정(60초 * 60분 * 24시간)
//			response.addCookie(setCookie); // response에 Cookie 추가
//			havecookie = true;
//			boardservice.PlusVisiter(boardDTO);
//		}
//		if (!havecookie) {
//			boardservice.PlusVisiter(boardDTO);
//			
//		}
		model.addAttribute("page", pageDTO);
		model.addAttribute("board0", boardDTO);
		model.addAttribute("board", boardservice.getDetail(boardDTO));
		model.addAttribute("replys", replyService.getReply(boardDTO));
		boardDTO.getBbno();


	}

}
