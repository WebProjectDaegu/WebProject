package com.spring.controller;

import static org.hamcrest.CoreMatchers.nullValue;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.domain.MemberDTO;
import com.spring.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/member")
public class memberController {
	@Autowired
	MemberService service;

	@GetMapping("/Login")
	public void login() {

	}

	@GetMapping("/memberRegister")
	public void register() {

	}

	@PostMapping("/memberRegisterProcess")
	public String memberRegisterProcess(@RequestParam("email") String email, @RequestParam("password") String password,
			@RequestParam("name") String name, @RequestParam("gender") String gender,
			@RequestParam("nickname") String nickname, @RequestParam("birth") String birth,
			@RequestParam("phone") String phone) {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(email);
		memberDTO.setPassword(password);
		memberDTO.setName(name);
		memberDTO.setGender(gender);
		memberDTO.setNickname(nickname);
		memberDTO.setBirth(birth);
		memberDTO.setPhone(phone);

		log.info(gender);
		log.info(memberDTO);
		service.register(memberDTO);

		return "redirect:/";
	}

	@PostMapping("/loginProcess")
	public String loginProcess(HttpServletRequest req,Model model ,@RequestParam("email") String email, @RequestParam("password") String password) {
		HttpSession session = req.getSession();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(email);
		memberDTO.setPassword(password);
		if(service.logincheck(memberDTO)== 1) {
			//service.login(memberDTO);
			log.info("로그인 성공");
			session.setAttribute("login", email);
			return "redirect:/";
			
		}else {
			log.info("로그인 실패");
			session.setAttribute("login", null);
			model.addAttribute("loginid", email);
			return "redirect:/member/Login";
			
			
		}
		
		


	}
	@GetMapping("/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/";
	}

}
