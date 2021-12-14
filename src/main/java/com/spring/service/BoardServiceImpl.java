package com.spring.service;


import com.spring.domain.BoardDTO;
import com.spring.domain.PageDTO;
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
	public List<BoardDTO> getBoardwithBoard(BoardDTO boardDTO,PageDTO pageDTO) {
		return mapper.getboardwithtype(boardDTO,pageDTO);
	}
	@Override
	public int gettotal(BoardDTO boardDTO, PageDTO pageDTO) {
		return mapper.getTotal(boardDTO, pageDTO);
	}
	@Override
	public void PlusVisiter(BoardDTO boardDTO) {
		mapper.PlusVisitor(boardDTO);
		
	}
	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) {
		return mapper.getdetail(boardDTO);
	}



}
