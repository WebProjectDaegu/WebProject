package com.spring.mapper;

import com.spring.domain.MemberDTO;

public interface MemberMapper {
	public void registermember(MemberDTO memberDTO);
	public int registermembercheck(MemberDTO memberDTO);
	public MemberDTO login(MemberDTO memberDTO);
	public int logincheck(MemberDTO memberDTO);
	
}
