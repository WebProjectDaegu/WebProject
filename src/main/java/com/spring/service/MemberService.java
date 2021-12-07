package com.spring.service;

import org.springframework.stereotype.Service;

import com.spring.domain.MemberDTO;
public interface MemberService {
	public String register(MemberDTO memberDTO) ;
	public String login(MemberDTO memberDTO);
	public int logincheck(MemberDTO memberDTO);
	public int registercheck(MemberDTO memberDTO);
}
