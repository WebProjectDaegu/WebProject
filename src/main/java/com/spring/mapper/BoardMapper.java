package com.spring.mapper;

import java.util.List;

import com.spring.domain.BoardDTO;
import com.spring.domain.MemberDTO;

public interface BoardMapper {
	public void registerBoard(BoardDTO BoardDTO);
	public BoardDTO getBoard(BoardDTO BoardDTO);
	public List<BoardDTO> getboardwithtype(String type);
}
