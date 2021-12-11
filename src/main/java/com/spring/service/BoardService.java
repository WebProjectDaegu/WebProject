package com.spring.service;

import java.util.List;

import com.spring.domain.BoardDTO;
import com.spring.domain.PageDTO;

public interface BoardService {
	public void RegisterBoard(BoardDTO boardDTO);
	public List<BoardDTO> getBoardwithBoard(BoardDTO BoardDTO,PageDTO pageDTO);
	public List<BoardDTO> getreviewWithlocation(BoardDTO boardDTO);
	public int gettotal(BoardDTO BoardDTO,PageDTO pageDTO);
}
