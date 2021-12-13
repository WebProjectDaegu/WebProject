package com.spring.service;

import java.util.List;

import com.spring.domain.BoardDTO;
import com.spring.domain.FestivalDTO;
import com.spring.domain.PageDTO;

public interface XMLService {
	public List<FestivalDTO> getList();
	public List<FestivalDTO> getListwithlocation(FestivalDTO festivalDTO,PageDTO pageDTO);
	public FestivalDTO getDetail(String name);
	public int gettotal(FestivalDTO festivalDTO, PageDTO pageDTO);
}
