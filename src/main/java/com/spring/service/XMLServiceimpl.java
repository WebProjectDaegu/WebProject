package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.BoardDTO;
import com.spring.domain.FestivalDTO;
import com.spring.mapper.FestivalMapper;
@Service
public class XMLServiceimpl implements XMLService {
	@Autowired
	private FestivalMapper mapper;
	@Override
	public List<FestivalDTO> getList() {
		return mapper.getlist();
	}
	@Override
	public FestivalDTO getDetail(String name) {
		// TODO Auto-generated method stub
		return mapper.getDetail(name);
	}
	@Override
	public List<FestivalDTO> getListwithlocation(FestivalDTO festivalDTO) {
		// TODO Auto-generated method stub
		return mapper.getlistwithlocation(festivalDTO);
	}


}
