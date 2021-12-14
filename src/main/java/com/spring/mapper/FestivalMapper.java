package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ietf.jgss.Oid;
import org.json.simple.JSONArray;

import com.spring.domain.BoardDTO;
import com.spring.domain.FestivalDTO;
import com.spring.domain.PageDTO;


public interface FestivalMapper {

	public void insertFestival(FestivalDTO festivalDTO);
	public List<FestivalDTO> getlist();
	public List<FestivalDTO> getlistwithlocation(FestivalDTO festivalDTO,PageDTO pageDTO);
	public FestivalDTO getDetail(FestivalDTO festivalDTO);
	public void plusVisiter(FestivalDTO festivalDTO);
	public int gettotal(FestivalDTO festivalDTO, PageDTO pageDTO);
}
