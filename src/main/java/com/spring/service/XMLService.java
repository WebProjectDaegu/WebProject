package com.spring.service;

import java.util.List;

import com.spring.domain.BoardDTO;
import com.spring.domain.FestivalDTO;

public interface XMLService {
	public List<FestivalDTO> getList();
	public List<FestivalDTO> getListwithlocation(FestivalDTO festivalDTO);
	public FestivalDTO getDetail(String name);
}
