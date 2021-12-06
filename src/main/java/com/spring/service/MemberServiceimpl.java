package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.MemberDTO;
import com.spring.mapper.FestivalMapper;
@Service
public class MemberServiceimpl implements MemberService {
	@Autowired
	
	@Override
	public void register(MemberDTO memberDTO) {
		
	}

}
