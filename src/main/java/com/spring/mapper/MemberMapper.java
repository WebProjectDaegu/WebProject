package com.spring.mapper;

import com.spring.domain.MemberDTO;

public interface MemberMapper {
	public void registermember(MemberDTO memberDTO);
	public void login(MemberDTO memberDTO);
	public int logincheck(MemberDTO memberDTO);
	
}