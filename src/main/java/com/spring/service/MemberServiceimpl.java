package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.MemberDTO;
import com.spring.mapper.FestivalMapper;
import com.spring.mapper.MemberMapper;
@Service
public class MemberServiceimpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	@Override
	public String register(MemberDTO memberDTO) {
		mapper.registermember(memberDTO);
		return memberDTO.getNickname();
	}
	@Override
	public MemberDTO login(MemberDTO memberDTO) {
		return mapper.login(memberDTO);
	}
	@Override
	public int logincheck(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return mapper.logincheck(memberDTO);
	}
	@Override
	public int registercheck(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return mapper.registermembercheck(memberDTO);
	}

}
