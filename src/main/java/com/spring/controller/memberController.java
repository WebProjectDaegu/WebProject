package com.spring.controller;

import static org.hamcrest.CoreMatchers.nullValue;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.FestivalDTO;
import com.spring.domain.MemberDTO;
import com.spring.mapper.FestivalMapper;
import com.spring.service.MemberService;
import com.spring.service.ReadFestival;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/member")
public class memberController {
	@Autowired
	MemberService service;
	@Autowired
	FestivalMapper mapper;
	

	@GetMapping("/Login")
	public void login() {

	}
	@PostMapping("/admin")
	public String testa() throws ParseException, java.text.ParseException, org.json.simple.parser.ParseException, IOException {
		ReadFestival a = new ReadFestival();
		List<FestivalDTO> b;
		for(int j = 0;j<11;j++) {
			b= a.read(j);
			for(int i =0;i<b.size();i++) {
				mapper.insertFestival(b.get(i));
			}
		}
		return "redirect:/";
		
	}
	@GetMapping("/memberRegister")
	public void register() {

	}

	@PostMapping("/memberRegisterProcess")
	public String memberRegisterProcess(RedirectAttributes model,@RequestParam("email") String email, @RequestParam("password") String password,
			@RequestParam("name") String name, @RequestParam("gender") String gender,
			@RequestParam("nickname") String nickname, @RequestParam("birth") String birth,
			@RequestParam("phone") String phone) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date =new Date(sdf.parse(birth).getTime());
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(email);
		memberDTO.setPassword(password);
		memberDTO.setName(name);
		memberDTO.setGender(gender);
		memberDTO.setNickname(nickname);
		memberDTO.setBirth(date);
		memberDTO.setPhone(phone);

		log.info(gender);
		log.info(memberDTO);
		
		if(service.registercheck(memberDTO)>= 1) {
			//service.login(memberDTO);
			log.info("회원가입 실패 이미있는 아이디입니다");
			//model.addAttribute("memberdto",memberDTO );
			//model.addAttribute("id",email );
			return "redirect:/member/memberRegister";
			
		}else {
			log.info("회원가입 성공");
			service.register(memberDTO);
			return "redirect:/";
			
			
		}

	}

	@PostMapping("/loginProcess")
	public String loginProcess(HttpServletRequest req,Model model ,@RequestParam("email") String email, @RequestParam("password") String password) {
		HttpSession session = req.getSession();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(email);
		memberDTO.setPassword(password);
		if(service.logincheck(memberDTO)>= 1) {
			//service.login(memberDTO);
			log.info("로그인 성공");
			session.setAttribute("login", service.login(memberDTO));
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
	@GetMapping("/MemberInfo")
	public void memberinfo() {
		
	}

}
