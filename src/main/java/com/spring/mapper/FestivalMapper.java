package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ietf.jgss.Oid;
import org.json.simple.JSONArray;

import com.spring.domain.FestivalDTO;


public interface FestivalMapper {

	public void insertFestival(FestivalDTO festivalDTO);
	public List<FestivalDTO> getlist();
	public FestivalDTO getDetail(String name);
}
