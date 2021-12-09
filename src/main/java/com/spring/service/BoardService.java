package com.spring.service;

import java.util.List;

import com.spring.domain.BoardDTO;

public interface BoardService {
	public void RegisterBoard(BoardDTO boardDTO);
	public List<BoardDTO> getBoardwithBoard(String type);
	public List<BoardDTO> getreviewWithlocation(BoardDTO boardDTO);
}
