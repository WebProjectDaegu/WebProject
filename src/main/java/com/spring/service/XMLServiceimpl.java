package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.BoardDTO;
import com.spring.domain.FestivalDTO;
import com.spring.domain.PageDTO;
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
	public List<FestivalDTO> getListwithlocation(FestivalDTO festivalDTO,PageDTO pageDTO) {
		// TODO Auto-generated method stub
		return mapper.getlistwithlocation(festivalDTO,pageDTO);
	}
	@Override
	public int gettotal(FestivalDTO festivalDTO, PageDTO pageDTO) {
		// TODO Auto-generated method stub
		return mapper.gettotal(festivalDTO, pageDTO);
	}
	@Override
	public FestivalDTO getdetail(FestivalDTO festivalDTO) {
		// TODO Auto-generated method stub
		return mapper.getDetail(festivalDTO);
	}
	@Override
	public void PlusVisiter(FestivalDTO festivalDTO) {
		mapper.plusVisiter(festivalDTO);
		
	}


}
