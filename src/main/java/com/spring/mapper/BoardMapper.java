package com.spring.mapper;

import java.util.List;

import com.spring.domain.BoardDTO;
import com.spring.domain.MemberDTO;
import com.spring.domain.PageDTO;

public interface BoardMapper {
	public void registerBoard(BoardDTO BoardDTO);
	public BoardDTO getdetail(BoardDTO BoardDTO);
	public List<BoardDTO> getboardwithtype(BoardDTO boardDTO,PageDTO pageDTO);
	public int getTotal(BoardDTO boardDTO,PageDTO pageDTO);
	public void PlusVisitor(BoardDTO boardDTO);
	public void PlusWriter(BoardDTO boardDTO);
	public void MinusWriter(BoardDTO boardDTO);

	
}
