package com.spring.service;


import com.spring.domain.BoardDTO;
import com.spring.mapper.BoardMapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardMapper mapper;
	public void RegisterBoard(BoardDTO boardDTO) {
		mapper.registerBoard(boardDTO);
	}
	@Override
	public List<BoardDTO> getBoardwithBoard(String type) {
		return mapper.getboardwithtype(type);
	}
	@Override
	public List<BoardDTO> getreviewWithlocation(BoardDTO boardDTO) {
		return mapper.getreviewwithlocation(boardDTO);
	}
}
